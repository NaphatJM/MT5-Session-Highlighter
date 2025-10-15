# How to Use Session Highlighter Indicator

> 📖 **Language:** [English](#english) | [ไทย (Thai)](#thai)

---

## English

### 📋 Step-by-Step Installation Guide

#### Step 1: Download and Install MetaTrader 5
1. **Download MT5:**
   - Visit [MetaTrader 5 official website](https://www.metatrader5.com/)
   - Download the appropriate version for your operating system
   - Install following the setup wizard

2. **Open MT5 Account:**
   - Contact your broker to get MT5 account details
   - Login to MT5 using your broker's credentials

#### Step 2: Install the Session Highlighter Indicator
1. **Download the Indicator:**
   - Download `SessionHighlight.mq5` file from the repository
   - Save it to your computer

2. **Copy to MT5 Directory:**
   ```
   Windows: C:\Users\[Username]\AppData\Roaming\MetaQuotes\Terminal\[Installation ID]\MQL5\Indicators\
   Mac: ~/Library/Application Support/MetaTrader 5/Indicators/
   ```

3. **Alternative Method - Using MT5 Interface:**
   - Open MetaTrader 5
   - Press `Ctrl + Shift + D` to open Data Folder
   - Navigate to `MQL5` → `Indicators`
   - Copy `SessionHighlight.mq5` here

#### Step 3: Compile the Indicator
1. **Open MetaEditor:**
   - In MT5, press `F4` or go to `Tools` → `MetaQuotes Language Editor`

2. **Compile:**
   - In MetaEditor, press `Ctrl + O` to open file
   - Navigate to the Indicators folder and select `SessionHighlight.mq5`
   - Press `F7` or click `Compile` button
   - Ensure compilation is successful (check the `Errors` tab)

#### Step 4: Apply to Chart
1. **Open Navigator:**
   - In MT5, press `Ctrl + N` or go to `View` → `Navigator`

2. **Find the Indicator:**
   - In Navigator, expand `Indicators` → `Custom`
   - Look for `SessionHighlight`

3. **Apply to Chart:**
   - Drag and drop `SessionHighlight` onto your chart
   - Or double-click the indicator name

#### Step 5: Configure Settings
1. **When the settings dialog appears:**
   ```
   Broker_GMT_Offset = [Your broker's GMT offset]
   
   Example for XM Broker:
   Broker_GMT_Offset = 3
   
   Show_Asia = true         (Enable Asian session)
   Show_London = true       (Enable London session)  
   Show_NewYork = true      (Enable New York session)
   ```

2. **Click OK to apply**

### 🔧 Basic Configuration

#### Finding Your Broker's GMT Offset
1. **Method 1 - Broker Website:**
   - Check your broker's website
   - Look for "Server Time" or "Trading Conditions"

2. **Method 2 - MT5 Terminal:**
   - Right-click on any symbol in Market Watch
   - Select `Symbols` → `Properties`
   - Check Trading Sessions times

3. **Method 3 - Compare Time:**
   - Compare current time on your chart with London market time
   - Calculate the difference

#### Common Broker GMT Offsets
- **XM:** GMT+3
- **FXDD:** GMT+2
- **IC Markets:** GMT+2
- **OANDA:** GMT-5
- **Forex.com:** GMT-5

### 📊 Using the Indicator

#### Understanding the Display
- **Colored boxes:** Represent active trading sessions
- **Labels:** Show session names at session start
- **Semi-transparent:** Allows you to see price action clearly

#### Session Times (Standard)
- **Asian Session:** Generally 00:00-12:00 (Broker Time)
- **London Session:** Generally 08:00-17:00 (Broker Time)
- **New York Session:** Generally 13:00-22:00 (Broker Time)

*Note: Times may vary depending on Daylight Saving Time*

#### Customizing Colors
1. **Right-click on chart** → `Indicators List`
2. **Select SessionHighlight** → `Edit`
3. **Modify color settings:**
   ```
   Asia_Color = C'21, 52, 72, 220'     (Blue)
   London_Color = C'60, 64, 72, 220'   (Gray)
   NewYork_Color = C'72, 49, 49, 220'  (Red)
   ```

### ⚠️ Troubleshooting

#### Indicator Not Showing
1. Check if compilation was successful
2. Verify `Broker_GMT_Offset` is correct
3. Ensure sessions are enabled (`Show_Asia = true`)
4. Refresh chart (F5)

#### Wrong Session Times
1. Verify your broker's GMT offset
2. Account for Daylight Saving Time changes
3. Compare with live market times

#### Performance Issues
1. Limit `MaxDaysToDraw` to reasonable number (15-30)
2. Remove other unnecessary indicators
3. Restart MT5 if needed

---

## Thai

### 📋 คำแนะนำการติดตั้งแบบขั้นตอน

#### ขั้นตอนที่ 1: ดาวน์โหลดและติดตั้ง MetaTrader 5
1. **ดาวน์โหลด MT5:**
   - เข้าเว็บไซต์ [MetaTrader 5 อย่างเป็นทางการ](https://www.metatrader5.com/)
   - ดาวน์โหลดเวอร์ชันที่เหมาะสมกับระบบปฏิบัติการของคุณ
   - ติดตั้งตาม setup wizard

2. **เปิดบัญชี MT5:**
   - ติดต่อ broker เพื่อขอรายละเอียดบัญชี MT5
   - เข้าสู่ระบบ MT5 ด้วยข้อมูลจาก broker

#### ขั้นตอนที่ 2: ติดตั้ง Session Highlighter Indicator
1. **ดาวน์โหลด Indicator:**
   - ดาวน์โหลดไฟล์ `SessionHighlight.mq5` จาก repository
   - บันทึกไว้ในคอมพิวเตอร์

2. **คัดลอกไปยังโฟลเดอร์ MT5:**
   ```
   Windows: C:\Users\[ชื่อผู้ใช้]\AppData\Roaming\MetaQuotes\Terminal\[Installation ID]\MQL5\Indicators\
   Mac: ~/Library/Application Support/MetaTrader 5/Indicators/
   ```

3. **วิธีอื่น - ใช้ interface ของ MT5:**
   - เปิด MetaTrader 5
   - กด `Ctrl + Shift + D` เพื่อเปิด Data Folder
   - ไปที่ `MQL5` → `Indicators`
   - คัดลอก `SessionHighlight.mq5` มาวางที่นี่

#### ขั้นตอนที่ 3: Compile Indicator
1. **เปิด MetaEditor:**
   - ใน MT5 กด `F4` หรือไปที่ `Tools` → `MetaQuotes Language Editor`

2. **Compile:**
   - ใน MetaEditor กด `Ctrl + O` เพื่อเปิดไฟล์
   - ไปที่โฟลเดอร์ Indicators และเลือก `SessionHighlight.mq5`
   - กด `F7` หรือคลิกปุ่ม `Compile`
   - ตรวจสอบว่า compilation สำเร็จ (ดูที่แท็บ `Errors`)

#### ขั้นตอนที่ 4: ใส่ใน Chart
1. **เปิด Navigator:**
   - ใน MT5 กด `Ctrl + N` หรือไปที่ `View` → `Navigator`

2. **หา Indicator:**
   - ใน Navigator ขยาย `Indicators` → `Custom`
   - หา `SessionHighlight`

3. **ใส่ใน Chart:**
   - ลาก `SessionHighlight` วางลงบน chart
   - หรือดับเบิลคลิกที่ชื่อ indicator

#### ขั้นตอนที่ 5: ตั้งค่า
1. **เมื่อหน้าต่างการตั้งค่าปรากฏ:**
   ```
   Broker_GMT_Offset = [GMT offset ของ broker]
   
   ตัวอย่างสำหรับ XM:
   Broker_GMT_Offset = 3
   
   Show_Asia = true         (เปิด Asian session)
   Show_London = true       (เปิด London session)  
   Show_NewYork = true      (เปิด New York session)
   ```

2. **คลิก OK เพื่อใช้งาน**

### 🔧 การตั้งค่าพื้นฐาน

#### การหา GMT Offset ของ Broker
1. **วิธีที่ 1 - เว็บไซต์ Broker:**
   - เช็คเว็บไซต์ของ broker
   - หาในส่วน "Server Time" หรือ "Trading Conditions"

2. **วิธีที่ 2 - เทอร์มินัล MT5:**
   - คลิกขวาที่ symbol ใดๆ ใน Market Watch
   - เลือก `Symbols` → `Properties`
   - ดูเวลา Trading Sessions

3. **วิธีที่ 3 - เปรียบเทียบเวลา:**
   - เปรียบเทียบเวลาปัจจุบันบน chart กับเวลาตลาด London
   - คำนวณส่วนต่าง

#### GMT Offset ของ Broker ยอดนิยม
- **XM:** GMT+3
- **FXDD:** GMT+2
- **IC Markets:** GMT+2
- **OANDA:** GMT-5
- **Forex.com:** GMT-5

### 📊 การใช้งาน Indicator

#### เข้าใจการแสดงผล
- **กล่องสี:** แสดงช่วงเวลาการซื้อขายที่ใช้งานอยู่
- **ป้ายชื่อ:** แสดงชื่อ session ที่จุดเริ่มต้นของ session
- **โปร่งใส:** ให้คุณเห็น price action ได้ชัดเจน

#### เวลา Session (มาตรฐาน)
- **Asian Session:** โดยทั่วไป 00:00-12:00 (เวลา Broker)
- **London Session:** โดยทั่วไป 08:00-17:00 (เวลา Broker)
- **New York Session:** โดยทั่วไป 13:00-22:00 (เวลา Broker)

*หมายเหตุ: เวลาอาจเปลี่ยนแปลงตาม Daylight Saving Time*

#### ปรับแต่งสี
1. **คลิกขวาบน chart** → `Indicators List`
2. **เลือก SessionHighlight** → `Edit`
3. **แก้ไขการตั้งค่าสี:**
   ```
   Asia_Color = C'21, 52, 72, 220'     (สีน้ำเงิน)
   London_Color = C'60, 64, 72, 220'   (สีเทา)
   NewYork_Color = C'72, 49, 49, 220'  (สีแดง)
   ```

### ⚠️ การแก้ไขปัญหา

#### Indicator ไม่แสดง
1. ตรวจสอบว่า compilation สำเร็จ
2. ตรวจสอบ `Broker_GMT_Offset` ให้ถูกต้อง
3. ให้แน่ใจว่าเปิด session แล้ว (`Show_Asia = true`)
4. รีเฟรช chart (F5)

#### เวลา Session ผิด
1. ตรวจสอบ GMT offset ของ broker
2. คำนึงถึงการเปลี่ยนแปลง Daylight Saving Time
3. เปรียบเทียบกับเวลาตลาดจริง

#### ปัญหาความเร็ว
1. จำกัด `MaxDaysToDraw` ให้เหมาะสม (15-30)
2. ลบ indicator อื่นที่ไม่จำเป็น
3. รีสตาร์ท MT5 หากจำเป็น

---

### 📞 การสนับสนุน / Support

**หากมีปัญหาเพิ่มเติม / If you need additional help:**
- 🐛 [Create GitHub Issue](https://github.com/NaphatJM/MT5-Session-Highlighter/issues)
- 📧 [Contact via GitHub](https://github.com/NaphatJM)

**เอกสารเพิ่มเติม / Additional Documentation:**
- 📖 [README (English)](README.md#english)
- 📖 [README (ไทย)](README.md#thai)
