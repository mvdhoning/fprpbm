Unit font;

Interface


Const
  defaultfont : Array[0..2047] of byte = (
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  8,  8,  8,  8,  8,  8,  0,  8,  8,  0,  0,  0,  0,
       0,  0,  0, 20, 20, 20, 20,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0, 72, 72,104,254, 36, 36,127, 20, 18, 18,  0,  0,  0,  0,  0,  0,
       0, 16,124,146, 18, 28,112,144,146,124, 16, 16,  0,  0,  0,  0,  0,
       6,  9,  9, 70, 56,102,144,144, 96,  0,  0,  0,  0,  0,  0,  0, 56,
       4,  4, 12,146,178,162, 70,188,  0,  0,  0,  0,  0,  0,  0,  8,  8,
       8,  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 48, 16, 16,  8,  8,
       8,  8,  8,  8, 16, 16, 32,  0,  0,  0,  0, 12,  8,  8, 16, 16, 16,
      16, 16, 16,  8,  8, 12,  0,  0,  0,  0,  0,  0, 16,146,124, 56,214,
      16,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  8,  8,127,  8,
       8,  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
      24, 24,  8,  4,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 28,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 24, 24,
       0,  0,  0,  0,  0,  0,  0, 64, 32, 32, 16, 16, 24,  8,  8,  4,  4,
       2,  0,  0,  0,  0,  0, 56, 68,130,130,146,130,130, 68, 56,  0,  0,
       0,  0,  0,  0,  0, 28, 16, 16, 16, 16, 16, 16, 16,124,  0,  0,  0,
       0,  0,  0,  0,124,194,128,128, 64, 48, 24,  4,254,  0,  0,  0,  0,
       0,  0,  0,124,130,128,192, 56,192,128,194,124,  0,  0,  0,  0,  0,
       0,  0, 96, 80, 88, 72, 68, 66,254, 64, 64,  0,  0,  0,  0,  0,  0,
       0,126,  2,  2, 62,192,128,128,194, 60,  0,  0,  0,  0,  0,  0,  0,
     120,132,  2,122,198,130,130,196,120,  0,  0,  0,  0,  0,  0,  0,254,
      64, 64, 32, 32, 16, 24,  8,  4,  0,  0,  0,  0,  0,  0,  0,124,130,
     130,130,124,130,130,134,124,  0,  0,  0,  0,  0,  0,  0, 60, 70,130,
     130,198,188,128, 66, 60,  0,  0,  0,  0,  0,  0,  0,  0,  0, 24, 24,
       0,  0,  0, 24, 24,  0,  0,  0,  0,  0,  0,  0,  0,  0, 24, 24,  0,
       0,  0, 24, 24,  8,  4,  0,  0,  0,  0,  0,  0,  0,128,112, 14, 14,
     112,128,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,254,  0,  0,254,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  2, 28,224,224, 28,  2,
       0,  0,  0,  0,  0,  0,  0,  0, 28, 34, 32, 16,  8,  8,  0,  8,  8,
       0,  0,  0,  0,  0,  0,  0,120,204,132,226,146,146,146,226,  4, 12,
     120,  0,  0,  0,  0,  0, 16, 40, 40, 40, 68, 68,124,198,130,  0,  0,
       0,  0,  0,  0,  0,126,130,130,130,126,130,130,130,126,  0,  0,  0,
       0,  0,  0,  0,120,132,  2,  2,  2,  2,  2,132,120,  0,  0,  0,  0,
       0,  0,  0, 62, 66,130,130,130,130,130, 66, 62,  0,  0,  0,  0,  0,
       0,  0,254,  2,  2,  2,254,  2,  2,  2,254,  0,  0,  0,  0,  0,  0,
       0,254,  2,  2,  2,254,  2,  2,  2,  2,  0,  0,  0,  0,  0,  0,  0,
     120,132,  2,  2,194,130,130,132,120,  0,  0,  0,  0,  0,  0,  0,130,
     130,130,130,254,130,130,130,130,  0,  0,  0,  0,  0,  0,  0, 62,  8,
       8,  8,  8,  8,  8,  8, 62,  0,  0,  0,  0,  0,  0,  0, 56, 32, 32,
      32, 32, 32, 32, 34, 28,  0,  0,  0,  0,  0,  0,  0, 66, 34, 18, 10,
      14, 18, 34, 34, 66,  0,  0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  2,
       2,  2,  2,254,  0,  0,  0,  0,  0,  0,  0,198,198,170,170,170,146,
     130,130,130,  0,  0,  0,  0,  0,  0,  0,134,134,138,138,146,162,162,
     194,194,  0,  0,  0,  0,  0,  0,  0, 56, 68,130,130,130,130,130, 68,
      56,  0,  0,  0,  0,  0,  0,  0,126,194,130,130,194,126,  2,  2,  2,
       0,  0,  0,  0,  0,  0,  0, 56, 68,130,130,130,130,130, 68,120, 96,
      64,  0,  0,  0,  0,  0,126,194,130,130,126, 66,130,130,  2,  0,  0,
       0,  0,  0,  0,  0,124,134,  2,  6,124,192,128,194,125,  0,  0,  0,
       0,  0,  0,  0,127,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  0,  0,
       0,  0,  0,130,130,130,130,130,130,130,130,124,  0,  0,  0,  0,  0,
       0,  0,130,198, 68, 68, 68, 40, 40, 40, 16,  0,  0,  0,  0,  0,  0,
       0,129,129,129, 90, 90, 90,102,102,102,  0,  0,  0,  0,  0,  0,  0,
     198, 68, 40, 56, 16, 40,108, 68,130,  0,  0,  0,  0,  0,  0,  0, 65,
      34, 20, 20,  8,  8,  8,  8,  8,  0,  0,  0,  0,  0,  0,  0,254,192,
      96, 32, 16,  8, 12,  6,254,  0,  0,  0,  0,  0, 56,  8,  8,  8,  8,
       8,  8,  8,  8,  8,  8, 56,  0,  0,  0,  0,  0,  0,  2,  4,  4,  8,
       8, 24, 16, 16, 32, 32, 64,  0,  0,  0, 28, 16, 16, 16, 16, 16, 16,
      16, 16, 16, 16, 28,  0,  0,  0,  0,  0,  0,  8, 20, 34, 99,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,127,  0,  0,  0,  8, 16,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 56, 68, 64,124, 66, 98, 92,
       0,  0,  0,  0,  0,  2,  2,  2,  2, 62,102, 66, 66, 66,102, 62,  0,
       0,  0,  0,  0,  0,  0,  0,  0, 56, 68,  2,  2,  2, 68, 56,  0,  0,
       0,  0,  0, 64, 64, 64, 64,124,102, 66, 66, 66,102,124,  0,  0,  0,
       0,  0,  0,  0,  0,  0, 60,102, 66,126,  2, 70, 60,  0,  0,  0,  0,
       0, 48,  8,  8,  8, 62,  8,  8,  8,  8,  8,  8,  0,  0,  0,  0,  0,
       0,  0,  0,  0,124,102, 66, 66, 66,102, 92, 64, 68, 56,  0,  0,  2,
       2,  2,  2, 58, 70, 66, 66, 66, 66, 66,  0,  0,  0,  0,  0,  8,  0,
       0,  0, 14,  8,  8,  8,  8,  8, 62,  0,  0,  0,  0,  0, 16,  0,  0,
       0, 28, 16, 16, 16, 16, 16, 16, 16, 16, 14,  0,  0,  2,  2,  2,  2,
      34, 18, 10, 14, 18, 34, 66,  0,  0,  0,  0,  0, 14,  8,  8,  8,  8,
       8,  8,  8,  8,  8,112,  0,  0,  0,  0,  0,  0,  0,  0,  0,254,146,
     146,146,146,146,146,  0,  0,  0,  0,  0,  0,  0,  0,  0, 58, 70, 66,
      66, 66, 66, 66,  0,  0,  0,  0,  0,  0,  0,  0,  0, 60,102, 66, 66,
      66,102, 60,  0,  0,  0,  0,  0,  0,  0,  0,  0, 62,102, 66, 66, 66,
     102, 62,  2,  2,  2,  0,  0,  0,  0,  0,  0,124,102, 66, 66, 66,102,
      92, 64, 64, 64,  0,  0,  0,  0,  0,  0, 60, 76,  4,  4,  4,  4,  4,
       0,  0,  0,  0,  0,  0,  0,  0,  0, 60, 66,  2, 60, 64, 66, 60,  0,
       0,  0,  0,  0,  0,  0,  8,  8,126,  8,  8,  8,  8,  8,112,  0,  0,
       0,  0,  0,  0,  0,  0,  0, 66, 66, 66, 66, 66, 98, 92,  0,  0,  0,
       0,  0,  0,  0,  0,  0, 66,102, 36, 36, 60, 24, 24,  0,  0,  0,  0,
       0,  0,  0,  0,  0,129,129, 90, 90, 90, 36, 36,  0,  0,  0,  0,  0,
       0,  0,  0,  0,102, 36, 24, 24, 24, 36,102,  0,  0,  0,  0,  0,  0,
       0,  0,  0, 66, 68, 36, 36, 40, 24, 16, 16,  8, 12,  0,  0,  0,  0,
       0,  0,126, 64, 32, 24,  4,  2,126,  0,  0,  0,  0,  0, 56,  8,  8,
       8,  8,  6,  8,  8,  8,  8,  8, 48,  0,  0,  0,  0,  8,  8,  8,  8,
       8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  0, 14,  8,  8,  8,  8,
      48,  8,  8,  8,  8,  8,  6,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     156, 98,  0,  0,  0,  0,  0,  0,  0,255,255,255,255,255,255,255,255,
     255,255,255,255,255,255,255,255);

Implementation

end.
