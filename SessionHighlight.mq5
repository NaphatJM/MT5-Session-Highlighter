//+------------------------------------------------------------------+
//|                           Session Highlighter Indicator v1.0    |
//|                                                   Author: NaphatJM |
//|                              Repository: https://github.com/NaphatJM |
//|                                                                    |
//| Description: Trading session highlighter for MT5 showing Asian,   |
//| London, and New York sessions with customizable colors and times. |
//+------------------------------------------------------------------+
#property copyright "NaphatJM"
#property link      "https://github.com/NaphatJM"
#property version   "1.00"
#property description "Session Highlighter - Displays major trading sessions on chart"

// Indicator properties
#property indicator_chart_window
#property indicator_buffers 0
#property indicator_plots   0

//+------------------------------------------------------------------+
//| Constants and Global Variables                                   |
//+------------------------------------------------------------------+
//--- Object name prefix to avoid conflicts with other indicators
#define INDICATOR_PREFIX "SessionBox_v1.0_"

//+------------------------------------------------------------------+
//| Input Parameters                                                 |
//+------------------------------------------------------------------+
//--- Display configuration
input group "=== Display Settings ==="
input int   MaxDaysToDraw    = 15;      // Maximum days to draw sessions
input int   TextLabelYOffset = 5;       // Label vertical offset in pixels

//--- Broker time zone settings  
input group "=== Broker Time Settings ==="
//--- IMPORTANT: Set this to match your broker's GMT offset
//--- For detailed setup instructions, see README.md
//--- Examples: XM = GMT+3, FXDD = GMT+2, OANDA = GMT-5
input int   Broker_GMT_Offset = 3;      // Your broker's GMT offset (XM = GMT+3)

//--- Asian session configuration
//--- For time conversion guide, see README.md
input group "=== Asian Session ==="
input bool  Show_Asia      = true;      // Show Asian session
input color Asia_Color     = C'21, 52, 72, 220';  // Asian session color (semi-transparent blue)
input int   Asia_StartHour = 0;         // Asian session start hour (Broker Time)
input int   Asia_EndHour   = 12;        // Asian session end hour (Broker Time)
input string Asia_Label    = "Asian";   // Asian session label text

//--- London session configuration  
//--- For time conversion guide, see README.md
input group "=== London Session ==="
input bool  Show_London    = true;      // Show London session
input color London_Color   = C'60, 64, 72, 220';  // London session color (semi-transparent gray)
input int   London_StartHour = 10;      // London session start hour (Broker Time)
input int   London_EndHour   = 19;      // London session end hour (Broker Time)
input string London_Label  = "London";  // London session label text

//--- New York session configuration
//--- For time conversion guide, see README.md
input group "=== New York Session ==="
input bool  Show_NewYork   = true;      // Show New York session
input color NewYork_Color  = C'72, 49, 49, 220';  // New York session color (semi-transparent red)
input int   NewYork_StartHour = 16;     // New York session start hour (Broker Time)
input int   NewYork_EndHour   = 23;     // New York session end hour (Broker Time)
input string NewYork_Label = "New York"; // New York session label text

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
    // Set indicator short name for display in chart window
    IndicatorSetString(INDICATOR_SHORTNAME, "Sessions (v1.0)");
    
    // Clean up any existing objects from previous runs
    ObjectsDeleteAll(0, INDICATOR_PREFIX);
    
    // Refresh chart display
    ChartRedraw();
    
    return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
    // Clean up all indicator objects when indicator is removed
    ObjectsDeleteAll(0, INDICATOR_PREFIX);
}

//+------------------------------------------------------------------+
//| Custom indicator calculation function                            |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
    int start_bar;
    
    // Initialize calculation from the beginning or continue from previous calculation
    if(prev_calculated == 0)
    {
        // Calculate start point based on MaxDaysToDraw setting
        datetime limit_time = TimeCurrent() - (MaxDaysToDraw * 86400); // 86400 seconds = 1 day
        start_bar = 0;
        
        // Find the bar index corresponding to the time limit
        for(int i = rates_total - 1; i >= 0; i--)
        {
            if(time[i] < limit_time)
            {
                start_bar = i;
                break;
            }
        }
    }
    else
    {
        // Continue from previous calculation point
        start_bar = prev_calculated > 0 ? prev_calculated - 1 : 0;
    }

    // Process each bar from start_bar to current bar
    for(int i = start_bar; i < rates_total; i++)
    {
        // Draw session boxes if enabled
        if(Show_Asia)
            DrawSessionBox(i, time, rates_total, Asia_StartHour, Asia_EndHour, Asia_Color, Asia_Label);
        if(Show_London)
            DrawSessionBox(i, time, rates_total, London_StartHour, London_EndHour, London_Color, London_Label);
        if(Show_NewYork)
            DrawSessionBox(i, time, rates_total, NewYork_StartHour, NewYork_EndHour, NewYork_Color, NewYork_Label);
    }
    
    return(rates_total);
}

//+------------------------------------------------------------------+
//| Check if given hour is within specified session time range      |
//+------------------------------------------------------------------+
//| Parameters:                                                      |
//|   hour_to_check - Hour to verify (0-23)                        |
//|   start_hour    - Session start hour (0-23)                    |
//|   end_hour      - Session end hour (0-23)                      |
//| Returns:                                                         |
//|   true if hour is within session, false otherwise              |
//+------------------------------------------------------------------+
bool IsInSession(int hour_to_check, int start_hour, int end_hour)
{
    // Handle normal session (start < end, e.g., 8 AM to 5 PM)
    if(start_hour < end_hour)
        return (hour_to_check >= start_hour && hour_to_check < end_hour);
    // Handle overnight session (start > end, e.g., 10 PM to 6 AM next day)
    else
        return (hour_to_check >= start_hour || hour_to_check < end_hour);
}

//+------------------------------------------------------------------+
//| Draw session highlight boxes and labels on chart                |
//+------------------------------------------------------------------+
//| Parameters:                                                      |
//|   bar_index    - Current bar index being processed             |
//|   time_array   - Array of bar times                            |
//|   total_rates  - Total number of bars available                |
//|   start_hour   - Session start hour                            |
//|   end_hour     - Session end hour                              |
//|   box_color    - Color for session highlight box               |
//|   label_text   - Text label for session name                   |
//+------------------------------------------------------------------+
void DrawSessionBox(int bar_index, const datetime &time_array[], int total_rates, int start_hour, int end_hour, color box_color, string label_text)
{
    datetime bar_time = time_array[bar_index];
    MqlDateTime current_dt;
    TimeToStruct(bar_time, current_dt);
    
    // Check if current bar time is within the trading session
    bool is_currently_in_session = IsInSession(current_dt.hour, start_hour, end_hour);
    if(!is_currently_in_session)
        return;

    // Create unique object name for the session box
    string box_name = INDICATOR_PREFIX + label_text + "_" + TimeToString(bar_time, TIME_DATE | TIME_MINUTES);
    
    // Create session highlight rectangle if it doesn't exist
    if(ObjectFind(0, box_name) < 0)
    {
        if(ObjectCreate(0, box_name, OBJ_RECTANGLE, 0, bar_time, 0))
        {
            // Set rectangle end time (next bar time or current bar + period)
            datetime time_end;
            if(bar_index < total_rates - 1)
                time_end = time_array[bar_index + 1];
            else
                time_end = bar_time + (long)PeriodSeconds();
            
            // Configure rectangle properties
            ObjectSetInteger(0, box_name, OBJPROP_TIME, 1, time_end);                    // End time
            ObjectSetDouble(0, box_name, OBJPROP_PRICE, 1, ChartGetDouble(0, CHART_PRICE_MAX)); // Top price
            ObjectSetInteger(0, box_name, OBJPROP_COLOR, box_color);                     // Box color
            ObjectSetInteger(0, box_name, OBJPROP_STYLE, STYLE_SOLID);                  // Line style
            ObjectSetInteger(0, box_name, OBJPROP_FILL, true);                          // Fill rectangle
            
            // Configure interaction properties for clean chart display
            ObjectSetInteger(0, box_name, OBJPROP_BACK, true);                          // Draw behind price
            ObjectSetInteger(0, box_name, OBJPROP_SELECTABLE, false);                  // Not selectable
            ObjectSetString(0, box_name, OBJPROP_TOOLTIP, "\n");                       // Empty tooltip
        }
    }
    
    // Check if we should draw a session label (at session start)
    datetime previous_bar_time = (bar_index > 0) ? time_array[bar_index-1] : 0;
    MqlDateTime prev_dt;
    TimeToStruct(previous_bar_time, prev_dt);
    bool was_previously_in_session = (previous_bar_time > 0) ? IsInSession(prev_dt.hour, start_hour, end_hour) : false;
    
    // Draw session label at the beginning of each session
    if(is_currently_in_session && !was_previously_in_session)
    {
       string label_name = INDICATOR_PREFIX + "Label_" + label_text + "_" + TimeToString(bar_time, TIME_DATE);
       
       // Create session label if it doesn't exist
       if(ObjectFind(0, label_name) < 0)
       {
           // Calculate label position near top of chart
           double chart_max_price = ChartGetDouble(0, CHART_PRICE_MAX);
           double chart_min_price = ChartGetDouble(0, CHART_PRICE_MIN);
           long chart_height_px = ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS, 0);
           
           if(chart_height_px <= 0) return; // Safety check
           
           // Calculate price per pixel and position label with offset
           double price_per_pixel = (chart_max_price - chart_min_price) / chart_height_px;
           double label_price_position = chart_max_price - (TextLabelYOffset * price_per_pixel);
           
           // Create and configure the text label
           if(ObjectCreate(0, label_name, OBJ_TEXT, 0, bar_time, label_price_position))
           {
               ObjectSetString(0, label_name, OBJPROP_TEXT, " " + label_text);          // Label text
               ObjectSetInteger(0, label_name, OBJPROP_COLOR, C'240,240,240');         // White text color
               ObjectSetInteger(0, label_name, OBJPROP_FONTSIZE, 10);                  // Font size
               ObjectSetInteger(0, label_name, OBJPROP_ANCHOR, ANCHOR_LEFT_UPPER);     // Anchor position
               ObjectSetInteger(0, label_name, OBJPROP_SELECTABLE, false);             // Not selectable
           }
       }
    }
}
//+------------------------------------------------------------------+