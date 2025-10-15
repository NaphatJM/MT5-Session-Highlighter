# Session Highlighter Indicator v1.0

[![MT5](https://img.shields.io/badge/Platform-MT5-blue.svg)](https://www.metatrader5.com/)
[![Version](https://img.shields.io/badge/Version-1.0-green.svg)](https://github.com/NaphatJM/SessionHighlight)

> 📖 **Language:** [English](#english) | [ไทย (Thai)](#thai) | [How to Use](HowToUse.md)


## English
A custom indicator for MetaTrader 5 that highlights major trading sessions (Asian, London, and New York) with customizable colors and labels.

## 🌟 Features

- ✅ Display Asian Session highlighting
- ✅ Display London Session highlighting  
- ✅ Display New York Session highlighting
- ✅ Customizable colors and transparency
- ✅ Enable/disable individual sessions
- ✅ Support for different broker GMT offsets
- ✅ Automatic session labels
- ✅ Non-intrusive chart interaction

## 📦 Installation

1. Download `SessionHighlight.mq5` file
2. Copy file to `MetaTrader 5/MQL5/Indicators/`
3. Open MetaTrader 5 and compile the indicator
4. Drag and drop the indicator onto your chart

**📋 For detailed step-by-step installation guide, see [HowToUse.md](HowToUse.md)**

## ⚙️ GMT Offset Configuration

### 🔍 How to Find Your Broker's GMT Offset

1. **Check Broker Website**
   - Look for Trading Conditions or Server Time section
   
2. **Check MT5 Terminal**
   - Market Watch → Right-click → Symbols → Properties
   - Look at Trading Sessions

3. **Compare with Live Market**
   - Compare chart time with actual market time

### 📊 Broker GMT Offset Comparison Table

| Broker | GMT Offset | Server Location | Example Time |
|--------|------------|-----------------|--------------|
| XM | GMT+3 | Cyprus | 15:00 = London 12:00 |
| FXDD | GMT+2 | Malta | 14:00 = London 12:00 |
| Admiral Markets | GMT+2 | Estonia | 14:00 = London 12:00 |
| IC Markets | GMT+2 | Cyprus | 14:00 = London 12:00 |
| Pepperstone | GMT+2 | London | 14:00 = London 12:00 |
| OANDA | GMT-5 | New York | 07:00 = London 12:00 |
| Forex.com | GMT-5 | New York | 07:00 = London 12:00 |

## 🕐 Local Time Calculation

### Formula
```
Local Time = Broker Time + (Your GMT Offset - Broker GMT Offset)
```

### 🌏 Examples for Different Countries

#### 🇹🇭 Thailand (GMT+7)
**Broker: XM (GMT+3)**
```
Thai Time = XM Time + (7 - 3) = XM Time + 4 hours

Asian Session:    00:00-12:00 (XM) = 04:00-16:00 (Thai)
London Session:   10:00-19:00 (XM) = 14:00-23:00 (Thai)
New York Session: 16:00-23:00 (XM) = 20:00-03:00 (Thai)
```

#### 🇺🇸 United States East Coast (GMT-5)
**Broker: XM (GMT+3)**
```
US Eastern Time = XM Time + (-5 - 3) = XM Time - 8 hours

Asian Session:    00:00-12:00 (XM) = 16:00-04:00 (US Eastern)
London Session:   10:00-19:00 (XM) = 02:00-11:00 (US Eastern)  
New York Session: 16:00-23:00 (XM) = 08:00-15:00 (US Eastern)
```

#### 🇬🇧 United Kingdom (GMT+0)
**Broker: XM (GMT+3)**
```
UK Time = XM Time + (0 - 3) = XM Time - 3 hours

Asian Session:    00:00-12:00 (XM) = 21:00-09:00 (UK)
London Session:   10:00-19:00 (XM) = 07:00-16:00 (UK)
New York Session: 16:00-23:00 (XM) = 13:00-20:00 (UK)
```

#### 🇦🇺 Australia (GMT+10)
**Broker: XM (GMT+3)**
```
Australian Time = XM Time + (10 - 3) = XM Time + 7 hours

Asian Session:    00:00-12:00 (XM) = 07:00-19:00 (AU)
London Session:   10:00-19:00 (XM) = 17:00-02:00 (AU)
New York Session: 16:00-23:00 (XM) = 23:00-06:00 (AU)
```

#### 🇯🇵 Japan (GMT+9)
**Broker: XM (GMT+3)**
```
Japan Time = XM Time + (9 - 3) = XM Time + 6 hours

Asian Session:    00:00-12:00 (XM) = 06:00-18:00 (JP)
London Session:   10:00-19:00 (XM) = 16:00-01:00 (JP)
New York Session: 16:00-23:00 (XM) = 22:00-05:00 (JP)
```

## 📋 Parameter Settings Example

### For XM Broker (GMT+3) and Thailand Location
```
Broker_GMT_Offset = 3

Asian Session:
- Asia_StartHour = 0    (00:00 XM = 04:00 Thai)
- Asia_EndHour = 12     (12:00 XM = 16:00 Thai)

London Session:
- London_StartHour = 10 (10:00 XM = 14:00 Thai)  
- London_EndHour = 19   (19:00 XM = 23:00 Thai)

New York Session:
- NewYork_StartHour = 16 (16:00 XM = 20:00 Thai)
- NewYork_EndHour = 23   (23:00 XM = 03:00 Thai)
```

## 🎨 Color Customization

### Color Format
```cpp
// Format: C'Red, Green, Blue, Alpha'
// Red, Green, Blue: 0-255
// Alpha: 0-255 (0=transparent, 255=opaque)

Asia_Color = C'21, 52, 72, 220';     // Semi-transparent blue
London_Color = C'60, 64, 72, 220';   // Semi-transparent gray  
NewYork_Color = C'72, 49, 49, 220';  // Semi-transparent red
```

### Recommended Colors
- **Blue:** `C'30, 144, 255, 180'`
- **Green:** `C'60, 179, 113, 180'`
- **Red:** `C'220, 20, 60, 180'`
- **Purple:** `C'138, 43, 226, 180'`
- **Orange:** `C'255, 140, 0, 180'`

## ❓ Frequently Asked Questions (FAQ)

### 🤔 Q: Why aren't sessions showing at the correct time?
**A:** Check your `Broker_GMT_Offset` setting to match your broker's GMT offset.

### 🤔 Q: How do I find my broker's GMT time?
**A:** 
1. Check broker website under Server Time or Trading Conditions
2. Compare chart time with actual market time
3. Contact broker support

### 🤔 Q: Do overnight sessions (e.g., 22:00-06:00) work?
**A:** Yes, the indicator supports sessions that cross midnight.

### 🤔 Q: How to make sessions more transparent?
**A:** Reduce the Alpha value (last number) in color settings, e.g., from 220 to 100.

### 🤔 Q: Session labels are too high/low on chart?
**A:** Adjust `TextLabelYOffset` - increase for lower labels, decrease for higher labels.

### 🤔 Q: Can I disable specific sessions?
**A:** Yes, set `Show_Asia`, `Show_London`, or `Show_NewYork` to `false`.

### 🤔 Q: Can I change session names?
**A:** Yes, modify `Asia_Label`, `London_Label`, `NewYork_Label`.

### 🤔 Q: Does the indicator use many resources?
**A:** No, it only uses chart objects with minimal calculations.

### 🤔 Q: Which timeframes are supported?
**A:** All timeframes, but recommended for H4 and Below.

### 🤔 Q: How to fix overlapping objects?
**A:** The indicator uses unique object names. If issues persist, clean chart template.

## 🛠️ Troubleshooting

### Sessions Not Showing
1. Check `Broker_GMT_Offset`
2. Verify session is enabled (`Show_Asia = true`)
3. Refresh chart (F5)

### Incorrect Timing
1. Recalculate GMT offset
2. Compare with live market
3. Adjust Start/End hours

### Objects Not Clearing After Removal
1. Use new template
2. Run script: `ObjectsDeleteAll(0, "SessionBox_v1.0_")`

## 📞 Contact & Support

- **GitHub:** [https://github.com/NaphatJM](https://github.com/NaphatJM)
- **Issues:** [Create GitHub Issue](https://github.com/NaphatJM/SessionHighlight/issues)
- **Version:** 1.0

## 📜 License & Credit

### 📋 Free to Use
This indicator is **completely FREE** to use for personal and commercial trading.

### ⭐ Credit Required
**IMPORTANT:** If you use, modify, or share this indicator, please give credit to the original author:

```
Original Author: NaphatJM
Repository: https://github.com/NaphatJM/MT5-Session-Highlighter
```

### 🔄 Sharing & Distribution
- ✅ Free to share with friends and trading communities
- ✅ Free to modify for personal use
- ✅ Free to use in commercial trading
- ⚠️ **Must include credit to original author**
- ❌ Cannot claim as your own work
- ❌ Cannot sell without permission

### 🤝 Contributing
Contributions are welcome! Please:
1. Fork the repository
2. Create your feature branch
3. Submit a pull request
4. Keep original author credit intact

## 📝 Updates

### v1.0 (Current)
- ✅ Display 3 major sessions
- ✅ GMT offset support
- ✅ Customizable colors
- ✅ Session labels

### Future (Planned)
- 🔄 Sydney Session
- 🔄 Session entry alerts
- 🔄 Session overlap display
- 🔄 Preset color templates

---

**⚡ For issues or suggestions, please [create an Issue](https://github.com/NaphatJM/SessionHighlight/issues) on GitHub**

## Thai

## 🌟 คุณสมบัติ

- ✅ แสดงช่วงเวลา Asian Session (เอเชีย)
- ✅ แสดงช่วงเวลา London Session (ลอนดอน)  
- ✅ แสดงช่วงเวลา New York Session (นิวยอร์ก)
- ✅ ปรับสีและความโปร่งใสได้
- ✅ เปิด/ปิดการแสดงแต่ละ Session ได้
- ✅ รองรับ Broker ที่มี GMT Offset ต่างกัน
- ✅ ป้ายชื่อ Session แสดงอัตโนมัติ
- ✅ ไม่รบกวนการคลิกบนกราฟ

## 📦 การติดตั้ง

1. ดาวน์โหลดไฟล์ `SessionHighlight.mq5`
2. คัดลอกไฟล์ไปยัง `MetaTrader 5/MQL5/Indicators/`
3. เปิด MetaTrader 5 และ Compile indicator
4. ลากไฟล์ไปวางบนกราฟที่ต้องการ

## ⚙️ การตั้งค่า GMT Offset

### 🔍 วิธีการหา GMT Offset ของ Broker

1. **ตรวจสอบจากเว็บไซต์ Broker**
   - เช็คในส่วน Trading Conditions หรือ Server Time
   
2. **ดูจากเทอร์มินัล MT5**
   - Market Watch → คลิกขวา → Symbols → Properties
   - ดูที่ Trading Sessions

3. **ทดสอบด้วยการเปรียบเทียบ**
   - เปรียบเทียบเวลาบนกราฟกับเวลาจริงของตลาด

### 📊 ตารางเปรียบเทียบ Broker GMT Offset

| Broker | GMT Offset | Server Location | ตัวอย่างเวลา |
|--------|------------|-----------------|-------------|
| XM | GMT+3 | Cyprus | 15:00 = London 12:00 |
| FXDD | GMT+2 | Malta | 14:00 = London 12:00 |
| Admiral Markets | GMT+2 | Estonia | 14:00 = London 12:00 |
| IC Markets | GMT+2 | Cyprus | 14:00 = London 12:00 |
| Pepperstone | GMT+2 | London | 14:00 = London 12:00 |
| OANDA | GMT-5 | New York | 07:00 = London 12:00 |
| Forex.com | GMT-5 | New York | 07:00 = London 12:00 |

## 🕐 การคำนวณเวลาท้องถิ่น

### สูตรการคำนวณ
```
เวลาท้องถิ่น = เวลา Broker + (GMT ของคุณ - GMT ของ Broker)
```

### 🌏 ตัวอย่างการคำนวณสำหรับแต่ละประเทศ

#### 🇹🇭 ประเทศไทย (GMT+7)
**Broker: XM (GMT+3)**
```
เวลาไทย = เวลา XM + (7 - 3) = เวลา XM + 4 ชั่วโมง

Asian Session:    00:00-12:00 (XM) = 04:00-16:00 (ไทย)
London Session:   10:00-19:00 (XM) = 14:00-23:00 (ไทย)
New York Session: 16:00-23:00 (XM) = 20:00-03:00 (ไทย)
```

#### 🇺🇸 สหรัฐอเมริกา East Coast (GMT-5)
**Broker: XM (GMT+3)**
```
เวลา US Eastern = เวลา XM + (-5 - 3) = เวลา XM - 8 ชั่วโมง

Asian Session:    00:00-12:00 (XM) = 16:00-04:00 (US Eastern)
London Session:   10:00-19:00 (XM) = 02:00-11:00 (US Eastern)  
New York Session: 16:00-23:00 (XM) = 08:00-15:00 (US Eastern)
```

#### 🇬🇧 อังกฤษ (GMT+0)
**Broker: XM (GMT+3)**
```
เวลาอังกฤษ = เวลา XM + (0 - 3) = เวลา XM - 3 ชั่วโมง

Asian Session:    00:00-12:00 (XM) = 21:00-09:00 (UK)
London Session:   10:00-19:00 (XM) = 07:00-16:00 (UK)
New York Session: 16:00-23:00 (XM) = 13:00-20:00 (UK)
```

#### 🇦🇺 ออสเตรเลีย (GMT+10)
**Broker: XM (GMT+3)**
```
เวลาออสเตรเลีย = เวลา XM + (10 - 3) = เวลา XM + 7 ชั่วโมง

Asian Session:    00:00-12:00 (XM) = 07:00-19:00 (AU)
London Session:   10:00-19:00 (XM) = 17:00-02:00 (AU)
New York Session: 16:00-23:00 (XM) = 23:00-06:00 (AU)
```

#### 🇯🇵 ญี่ปุ่น (GMT+9)
**Broker: XM (GMT+3)**
```
เวลาญี่ปุ่น = เวลา XM + (9 - 3) = เวลา XM + 6 ชั่วโมง

Asian Session:    00:00-12:00 (XM) = 06:00-18:00 (JP)
London Session:   10:00-19:00 (XM) = 16:00-01:00 (JP)
New York Session: 16:00-23:00 (XM) = 22:00-05:00 (JP)
```

## 📋 ตัวอย่างการตั้งค่าพารามิเตอร์

### สำหรับ Broker XM (GMT+3) และอยู่ประเทศไทย
```
Broker_GMT_Offset = 3

Asian Session:
- Asia_StartHour = 0    (00:00 XM = 04:00 ไทย)
- Asia_EndHour = 12     (12:00 XM = 16:00 ไทย)

London Session:
- London_StartHour = 10 (10:00 XM = 14:00 ไทย)  
- London_EndHour = 19   (19:00 XM = 23:00 ไทย)

New York Session:
- NewYork_StartHour = 16 (16:00 XM = 20:00 ไทย)
- NewYork_EndHour = 23   (23:00 XM = 03:00 ไทย)
```

## 🎨 การปรับแต่งสี

### รูปแบบการกำหนดสี
```cpp
// รูปแบบ: C'Red, Green, Blue, Alpha'
// Red, Green, Blue: 0-255
// Alpha: 0-255 (0=โปร่งใส, 255=ทึบ)

Asia_Color = C'21, 52, 72, 220';     // สีน้ำเงินโปร่งใส
London_Color = C'60, 64, 72, 220';   // สีเทาโปร่งใส  
NewYork_Color = C'72, 49, 49, 220';  // สีแดงโปร่งใส
```

### ตัวอย่างสีที่แนะนำ
- **สีน้ำเงิน:** `C'30, 144, 255, 180'`
- **สีเขียว:** `C'60, 179, 113, 180'`
- **สีแดง:** `C'220, 20, 60, 180'`
- **สีม่วง:** `C'138, 43, 226, 180'`
- **สีส้ม:** `C'255, 140, 0, 180'`

## ❓ คำถามที่พบบ่อย (FAQ)

### 🤔 Q: ทำไม Session ไม่แสดงในเวลาที่ถูกต้อง?
**A:** ตรวจสอบการตั้งค่า `Broker_GMT_Offset` ให้ตรงกับ GMT Offset ของ Broker ที่คุณใช้

### 🤔 Q: จะหาเวลา GMT ของ Broker ได้อย่างไร?
**A:** 
1. ดูจากเว็บไซต์ Broker ในหัวข้อ Server Time
2. เปรียบเทียบเวลาบนกราฟกับเวลาตลาดจริง
3. ติดต่อ Support ของ Broker

### 🤔 Q: Session บางครั้งข้ามวัน (เช่น 22:00-06:00) จะทำงานไหม?
**A:** ได้ครับ Indicator รองรับ Session ที่ข้ามวันได้

### 🤔 Q: จะเปลี่ยนสีให้โปร่งใสมากขึ้นได้ไหม?
**A:** ได้ โดยลดค่า Alpha (ตัวเลขสุดท้าย) ใน Color setting เช่น จาก 220 เป็น 100

### 🤔 Q: ป้ายชื่อ Session อยู่สูงเกินไป/ต่ำเกินไป?
**A:** ปรับค่า `TextLabelYOffset` - เพิ่มค่าเพื่อให้ป้ายอยู่ต่ำลง, ลดค่าเพื่อให้อยู่สูงขึ้น

### 🤔 Q: จะปิดการแสดง Session ใดก็ได้ไหม?
**A:** ได้ โดยเปลี่ยน `Show_Asia`, `Show_London`, หรือ `Show_NewYork` เป็น `false`

### 🤔 Q: จะเปลี่ยนชื่อ Session ได้ไหม?
**A:** ได้ โดยแก้ไข `Asia_Label`, `London_Label`, `NewYork_Label`

### 🤔 Q: Indicator ใช้ทรัพยากรเยอะไหม?
**A:** น้อยมาก เพราะใช้เฉพาะ Object บนกราฟ ไม่มีการคำนวณที่ซับซ้อน

### 🤔 Q: รองรับ Timeframe ไหนบ้าง?
**A:** รองรับทุก Timeframe ภายใน 1 วัน

### 🤔 Q: จะแก้ปัญหา Object ซ้อนทับได้ไหม?
**A:** Indicator ใช้ชื่อ Object ที่ไม่ซ้ำกัน หากมีปัญหาให้ลบ Object เก่าโดยใช้ Template Clean

## 🛠️ การแก้ไขปัญหา

### Session ไม่แสดง
1. ตรวจสอบ `Broker_GMT_Offset`
2. ตรวจสอบว่าเปิด Session นั้นๆ แล้ว (`Show_Asia = true`)
3. ลอง Refresh กราฟ (F5)

### เวลาไม่ตรง
1. คำนวณ GMT Offset ใหม่
2. เปรียบเทียบกับตลาดจริง
3. ปรับเวลา Start/End Hour

### Object ไม่หายหลังลบ Indicator
1. ใช้ Template ใหม่
2. รัน script ลบ Object: `ObjectsDeleteAll(0, "SessionBox_v1.0_")`

## 📞 การติดต่อและสนับสนุน

- **GitHub:** [https://github.com/NaphatJM](https://github.com/NaphatJM)
- **Email:** [ติดต่อผ่าน GitHub Issues](https://github.com/NaphatJM/SessionHighlight/issues)
- **Version:** 1.0

## 📜 ลิขสิทธิ์และการให้เครดิต

### 📋 ฟรีสำหรับการใช้งาน
Indicator นี้ **ฟรี 100%** สำหรับการใช้งานส่วนตัวและการเทรดเชิงพาณิชย์

### ⭐ ต้องให้เครดิตเสมอ
**สำคัญมาก:** หากคุณใช้งาน แก้ไข หรือแชร์ indicator นี้ กรุณาให้เครดิตผู้สร้างเสมอ:

```
ผู้สร้างต้นฉบับ: NaphatJM
Repository: https://github.com/NaphatJM/MT5-Session-Highlighter
```

### 🔄 การแชร์และเผยแพร่
- ✅ แชร์ให้เพื่อนและชุมชนเทรดได้ฟรี
- ✅ แก้ไขเพื่อใช้งานส่วนตัวได้ฟรี
- ✅ ใช้งานเพื่อการเทรดเชิงพาณิชย์ได้ฟรี
- ⚠️ **ต้องระบุเครดิตผู้สร้างต้นฉบับเสมอ**
- ❌ ห้ามอ้างว่าเป็นผลงานของตัวเอง
- ❌ ห้ามขายโดยไม่ได้รับอนุญาต

### 🤝 การมีส่วนร่วม
ยินดีรับการมีส่วนร่วม! กรุณา:
1. Fork repository
2. สร้าง feature branch ของคุณ
3. ส่ง pull request
4. เก็บเครดิตผู้สร้างต้นฉบับไว้

## 📝 การอัพเดต

### v1.0 (Current)
- ✅ แสดง 3 Session หลัก
- ✅ รองรับ GMT Offset
- ✅ ปรับแต่งสีได้
- ✅ ป้ายชื่อ Session

### อนาคต (Planned)
- 🔄 Sydney Session
- 🔄 การแจ้งเตือนเมื่อเข้า Session
- 🔄 แสดงช่วงเวลา Overlap
- 🔄 Template สีสำเร็จรูป

---

**⚡ หากมีปัญหาหรือข้อเสนอแนะ กรุณา [สร้าง Issue](https://github.com/NaphatJM/SessionHighlight/issues) ใน GitHub**
