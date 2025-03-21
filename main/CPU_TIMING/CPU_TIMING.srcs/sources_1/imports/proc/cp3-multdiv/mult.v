module mult(data_A, data_B, data_result, data_exception, data_resultRDY, clock, ctrl_MULT);

    input [31:0] data_A, data_B;
    input clock, ctrl_MULT;
    output [31:0] data_result;
    output data_exception, data_resultRDY;
    wire [63:0] mult_out;
    
    wire w0_00, w0_10, w0_100, w0_110, w0_120, w0_130, w0_140, w0_150, w0_160, w0_170, 
      w0_180, w0_190, w0_20, w0_200, w0_210, w0_220, w0_230, w0_240, w0_250, w0_260, 
      w0_270, w0_280, w0_290, w0_30, w0_300, w0_310, w0_40, w0_50, w0_60, w0_70, 
      w0_80, w0_90, w10_010, w10_1010, w10_110, w10_1110, w10_1210, w10_1310, w10_1410, w10_1510, 
      w10_1610, w10_1710, w10_1810, w10_1910, w10_2010, w10_210, w10_2110, w10_2210, w10_2310, w10_2410, 
      w10_2510, w10_2610, w10_2710, w10_2810, w10_2910, w10_3010, w10_310, w10_3110, w10_410, w10_510, 
      w10_610, w10_710, w10_810, w10_910, w11_011, w11_1011, w11_111, w11_1111, w11_1211, w11_1311, 
      w11_1411, w11_1511, w11_1611, w11_1711, w11_1811, w11_1911, w11_2011, w11_211, w11_2111, w11_2211, 
      w11_2311, w11_2411, w11_2511, w11_2611, w11_2711, w11_2811, w11_2911, w11_3011, w11_311, w11_3111, 
      w11_411, w11_511, w11_611, w11_711, w11_811, w11_911, w12_012, w12_1012, w12_1112, w12_112, 
      w12_1212, w12_1312, w12_1412, w12_1512, w12_1612, w12_1712, w12_1812, w12_1912, w12_2012, w12_2112, 
      w12_212, w12_2212, w12_2312, w12_2412, w12_2512, w12_2612, w12_2712, w12_2812, w12_2912, w12_3012, 
      w12_3112, w12_312, w12_412, w12_512, w12_612, w12_712, w12_812, w12_912, w13_013, w13_1013, 
      w13_1113, w13_113, w13_1213, w13_1313, w13_1413, w13_1513, w13_1613, w13_1713, w13_1813, w13_1913, 
      w13_2013, w13_2113, w13_213, w13_2213, w13_2313, w13_2413, w13_2513, w13_2613, w13_2713, w13_2813, 
      w13_2913, w13_3013, w13_3113, w13_313, w13_413, w13_513, w13_613, w13_713, w13_813, w13_913, 
      w14_014, w14_1014, w14_1114, w14_114, w14_1214, w14_1314, w14_1414, w14_1514, w14_1614, w14_1714, 
      w14_1814, w14_1914, w14_2014, w14_2114, w14_214, w14_2214, w14_2314, w14_2414, w14_2514, w14_2614, 
      w14_2714, w14_2814, w14_2914, w14_3014, w14_3114, w14_314, w14_414, w14_514, w14_614, w14_714, 
      w14_814, w14_914, w15_015, w15_1015, w15_1115, w15_115, w15_1215, w15_1315, w15_1415, w15_1515, 
      w15_1615, w15_1715, w15_1815, w15_1915, w15_2015, w15_2115, w15_215, w15_2215, w15_2315, w15_2415, 
      w15_2515, w15_2615, w15_2715, w15_2815, w15_2915, w15_3015, w15_3115, w15_315, w15_415, w15_515, 
      w15_615, w15_715, w15_815, w15_915, w16_016, w16_1016, w16_1116, w16_116, w16_1216, w16_1316, 
      w16_1416, w16_1516, w16_1616, w16_1716, w16_1816, w16_1916, w16_2016, w16_2116, w16_216, w16_2216, 
      w16_2316, w16_2416, w16_2516, w16_2616, w16_2716, w16_2816, w16_2916, w16_3016, w16_3116, w16_316, 
      w16_416, w16_516, w16_616, w16_716, w16_816, w16_916, w17_017, w17_1017, w17_1117, w17_117, 
      w17_1217, w17_1317, w17_1417, w17_1517, w17_1617, w17_1717, w17_1817, w17_1917, w17_2017, w17_2117, 
      w17_217, w17_2217, w17_2317, w17_2417, w17_2517, w17_2617, w17_2717, w17_2817, w17_2917, w17_3017, 
      w17_3117, w17_317, w17_417, w17_517, w17_617, w17_717, w17_817, w17_917, w18_018, w18_1018, 
      w18_1118, w18_118, w18_1218, w18_1318, w18_1418, w18_1518, w18_1618, w18_1718, w18_1818, w18_1918, 
      w18_2018, w18_2118, w18_218, w18_2218, w18_2318, w18_2418, w18_2518, w18_2618, w18_2718, w18_2818, 
      w18_2918, w18_3018, w18_3118, w18_318, w18_418, w18_518, w18_618, w18_718, w18_818, w18_918, 
      w19_019, w19_1019, w19_1119, w19_119, w19_1219, w19_1319, w19_1419, w19_1519, w19_1619, w19_1719, 
      w19_1819, w19_1919, w19_2019, w19_2119, w19_219, w19_2219, w19_2319, w19_2419, w19_2519, w19_2619, 
      w19_2719, w19_2819, w19_2919, w19_3019, w19_3119, w19_319, w19_419, w19_519, w19_619, w19_719, 
      w19_819, w19_919, w1_01, w1_101, w1_11, w1_111, w1_121, w1_131, w1_141, w1_151, 
      w1_161, w1_171, w1_181, w1_191, w1_201, w1_21, w1_211, w1_221, w1_231, w1_241, 
      w1_251, w1_261, w1_271, w1_281, w1_291, w1_301, w1_31, w1_311, w1_41, w1_51, 
      w1_61, w1_71, w1_81, w1_91, w20_020, w20_1020, w20_1120, w20_120, w20_1220, w20_1320, 
      w20_1420, w20_1520, w20_1620, w20_1720, w20_1820, w20_1920, w20_2020, w20_2120, w20_220, w20_2220, 
      w20_2320, w20_2420, w20_2520, w20_2620, w20_2720, w20_2820, w20_2920, w20_3020, w20_3120, w20_320, 
      w20_420, w20_520, w20_620, w20_720, w20_820, w20_920, w21_021, w21_1021, w21_1121, w21_121, 
      w21_1221, w21_1321, w21_1421, w21_1521, w21_1621, w21_1721, w21_1821, w21_1921, w21_2021, w21_2121, 
      w21_221, w21_2221, w21_2321, w21_2421, w21_2521, w21_2621, w21_2721, w21_2821, w21_2921, w21_3021, 
      w21_3121, w21_321, w21_421, w21_521, w21_621, w21_721, w21_821, w21_921, w22_022, w22_1022, 
      w22_1122, w22_122, w22_1222, w22_1322, w22_1422, w22_1522, w22_1622, w22_1722, w22_1822, w22_1922, 
      w22_2022, w22_2122, w22_222, w22_2222, w22_2322, w22_2422, w22_2522, w22_2622, w22_2722, w22_2822, 
      w22_2922, w22_3022, w22_3122, w22_322, w22_422, w22_522, w22_622, w22_722, w22_822, w22_922, 
      w23_023, w23_1023, w23_1123, w23_1223, w23_123, w23_1323, w23_1423, w23_1523, w23_1623, w23_1723, 
      w23_1823, w23_1923, w23_2023, w23_2123, w23_2223, w23_223, w23_2323, w23_2423, w23_2523, w23_2623, 
      w23_2723, w23_2823, w23_2923, w23_3023, w23_3123, w23_323, w23_423, w23_523, w23_623, w23_723, 
      w23_823, w23_923, w24_024, w24_1024, w24_1124, w24_1224, w24_124, w24_1324, w24_1424, w24_1524, 
      w24_1624, w24_1724, w24_1824, w24_1924, w24_2024, w24_2124, w24_2224, w24_224, w24_2324, w24_2424, 
      w24_2524, w24_2624, w24_2724, w24_2824, w24_2924, w24_3024, w24_3124, w24_324, w24_424, w24_524, 
      w24_624, w24_724, w24_824, w24_924, w25_025, w25_1025, w25_1125, w25_1225, w25_125, w25_1325, 
      w25_1425, w25_1525, w25_1625, w25_1725, w25_1825, w25_1925, w25_2025, w25_2125, w25_2225, w25_225, 
      w25_2325, w25_2425, w25_2525, w25_2625, w25_2725, w25_2825, w25_2925, w25_3025, w25_3125, w25_325, 
      w25_425, w25_525, w25_625, w25_725, w25_825, w25_925, w26_026, w26_1026, w26_1126, w26_1226, 
      w26_126, w26_1326, w26_1426, w26_1526, w26_1626, w26_1726, w26_1826, w26_1926, w26_2026, w26_2126, 
      w26_2226, w26_226, w26_2326, w26_2426, w26_2526, w26_2626, w26_2726, w26_2826, w26_2926, w26_3026, 
      w26_3126, w26_326, w26_426, w26_526, w26_626, w26_726, w26_826, w26_926, w27_027, w27_1027, 
      w27_1127, w27_1227, w27_127, w27_1327, w27_1427, w27_1527, w27_1627, w27_1727, w27_1827, w27_1927, 
      w27_2027, w27_2127, w27_2227, w27_227, w27_2327, w27_2427, w27_2527, w27_2627, w27_2727, w27_2827, 
      w27_2927, w27_3027, w27_3127, w27_327, w27_427, w27_527, w27_627, w27_727, w27_827, w27_927, 
      w28_028, w28_1028, w28_1128, w28_1228, w28_128, w28_1328, w28_1428, w28_1528, w28_1628, w28_1728, 
      w28_1828, w28_1928, w28_2028, w28_2128, w28_2228, w28_228, w28_2328, w28_2428, w28_2528, w28_2628, 
      w28_2728, w28_2828, w28_2928, w28_3028, w28_3128, w28_328, w28_428, w28_528, w28_628, w28_728, 
      w28_828, w28_928, w29_029, w29_1029, w29_1129, w29_1229, w29_129, w29_1329, w29_1429, w29_1529, 
      w29_1629, w29_1729, w29_1829, w29_1929, w29_2029, w29_2129, w29_2229, w29_229, w29_2329, w29_2429, 
      w29_2529, w29_2629, w29_2729, w29_2829, w29_2929, w29_3029, w29_3129, w29_329, w29_429, w29_529, 
      w29_629, w29_729, w29_829, w29_929, w2_02, w2_102, w2_112, w2_12, w2_122, w2_132, 
      w2_142, w2_152, w2_162, w2_172, w2_182, w2_192, w2_202, w2_212, w2_22, w2_222, 
      w2_232, w2_242, w2_252, w2_262, w2_272, w2_282, w2_292, w2_302, w2_312, w2_32, 
      w2_42, w2_52, w2_62, w2_72, w2_82, w2_92, w30_030, w30_1030, w30_1130, w30_1230, 
      w30_130, w30_1330, w30_1430, w30_1530, w30_1630, w30_1730, w30_1830, w30_1930, w30_2030, w30_2130, 
      w30_2230, w30_230, w30_2330, w30_2430, w30_2530, w30_2630, w30_2730, w30_2830, w30_2930, w30_3030, 
      w30_3130, w30_330, w30_430, w30_530, w30_630, w30_730, w30_830, w30_930, w31_031, w31_1031, 
      w31_1131, w31_1231, w31_131, w31_1331, w31_1431, w31_1531, w31_1631, w31_1731, w31_1831, w31_1931, 
      w31_2031, w31_2131, w31_2231, w31_231, w31_2331, w31_2431, w31_2531, w31_2631, w31_2731, w31_2831, 
      w31_2931, w31_3031, w31_3131, w31_331, w31_431, w31_531, w31_631, w31_731, w31_831, w31_931, 
      w3_03, w3_103, w3_113, w3_123, w3_13, w3_133, w3_143, w3_153, w3_163, w3_173, 
      w3_183, w3_193, w3_203, w3_213, w3_223, w3_23, w3_233, w3_243, w3_253, w3_263, 
      w3_273, w3_283, w3_293, w3_303, w3_313, w3_33, w3_43, w3_53, w3_63, w3_73, 
      w3_83, w3_93, w4_04, w4_104, w4_114, w4_124, w4_134, w4_14, w4_144, w4_154, 
      w4_164, w4_174, w4_184, w4_194, w4_204, w4_214, w4_224, w4_234, w4_24, w4_244, 
      w4_254, w4_264, w4_274, w4_284, w4_294, w4_304, w4_314, w4_34, w4_44, w4_54, 
      w4_64, w4_74, w4_84, w4_94, w5_05, w5_105, w5_115, w5_125, w5_135, w5_145, 
      w5_15, w5_155, w5_165, w5_175, w5_185, w5_195, w5_205, w5_215, w5_225, w5_235, 
      w5_245, w5_25, w5_255, w5_265, w5_275, w5_285, w5_295, w5_305, w5_315, w5_35, 
      w5_45, w5_55, w5_65, w5_75, w5_85, w5_95, w6_06, w6_106, w6_116, w6_126, 
      w6_136, w6_146, w6_156, w6_16, w6_166, w6_176, w6_186, w6_196, w6_206, w6_216, 
      w6_226, w6_236, w6_246, w6_256, w6_26, w6_266, w6_276, w6_286, w6_296, w6_306, 
      w6_316, w6_36, w6_46, w6_56, w6_66, w6_76, w6_86, w6_96, w7_07, w7_107, 
      w7_117, w7_127, w7_137, w7_147, w7_157, w7_167, w7_17, w7_177, w7_187, w7_197, 
      w7_207, w7_217, w7_227, w7_237, w7_247, w7_257, w7_267, w7_27, w7_277, w7_287, 
      w7_297, w7_307, w7_317, w7_37, w7_47, w7_57, w7_67, w7_77, w7_87, w7_97, 
      w8_08, w8_108, w8_118, w8_128, w8_138, w8_148, w8_158, w8_168, w8_178, w8_18, 
      w8_188, w8_198, w8_208, w8_218, w8_228, w8_238, w8_248, w8_258, w8_268, w8_278, 
      w8_28, w8_288, w8_298, w8_308, w8_318, w8_38, w8_48, w8_58, w8_68, w8_78, 
      w8_88, w8_98, w9_09, w9_109, w9_119, w9_129, w9_139, w9_149, w9_159, w9_169, 
      w9_179, w9_189, w9_19, w9_199, w9_209, w9_219, w9_229, w9_239, w9_249, w9_259, 
      w9_269, w9_279, w9_289, w9_29, w9_299, w9_309, w9_319, w9_39, w9_49, w9_59, 
      w9_69, w9_79, w9_89, w9_99, wc0_310, wc10_010, wc10_1010, wc10_110, wc10_1110, wc10_1210, 
      wc10_1310, wc10_1410, wc10_1510, wc10_1610, wc10_1710, wc10_1810, wc10_1910, wc10_2010, wc10_210, wc10_2110, 
      wc10_2210, wc10_2310, wc10_2410, wc10_2510, wc10_2610, wc10_2710, wc10_2810, wc10_2910, wc10_3010, wc10_310, 
      wc10_3110, wc10_410, wc10_510, wc10_610, wc10_710, wc10_810, wc10_910, wc11_011, wc11_1011, wc11_111, 
      wc11_1111, wc11_1211, wc11_1311, wc11_1411, wc11_1511, wc11_1611, wc11_1711, wc11_1811, wc11_1911, wc11_2011, 
      wc11_211, wc11_2111, wc11_2211, wc11_2311, wc11_2411, wc11_2511, wc11_2611, wc11_2711, wc11_2811, wc11_2911, 
      wc11_3011, wc11_311, wc11_3111, wc11_411, wc11_511, wc11_611, wc11_711, wc11_811, wc11_911, wc12_012, 
      wc12_1012, wc12_1112, wc12_112, wc12_1212, wc12_1312, wc12_1412, wc12_1512, wc12_1612, wc12_1712, wc12_1812, 
      wc12_1912, wc12_2012, wc12_2112, wc12_212, wc12_2212, wc12_2312, wc12_2412, wc12_2512, wc12_2612, wc12_2712, 
      wc12_2812, wc12_2912, wc12_3012, wc12_3112, wc12_312, wc12_412, wc12_512, wc12_612, wc12_712, wc12_812, 
      wc12_912, wc13_013, wc13_1013, wc13_1113, wc13_113, wc13_1213, wc13_1313, wc13_1413, wc13_1513, wc13_1613, 
      wc13_1713, wc13_1813, wc13_1913, wc13_2013, wc13_2113, wc13_213, wc13_2213, wc13_2313, wc13_2413, wc13_2513, 
      wc13_2613, wc13_2713, wc13_2813, wc13_2913, wc13_3013, wc13_3113, wc13_313, wc13_413, wc13_513, wc13_613, 
      wc13_713, wc13_813, wc13_913, wc14_014, wc14_1014, wc14_1114, wc14_114, wc14_1214, wc14_1314, wc14_1414, 
      wc14_1514, wc14_1614, wc14_1714, wc14_1814, wc14_1914, wc14_2014, wc14_2114, wc14_214, wc14_2214, wc14_2314, 
      wc14_2414, wc14_2514, wc14_2614, wc14_2714, wc14_2814, wc14_2914, wc14_3014, wc14_3114, wc14_314, wc14_414, 
      wc14_514, wc14_614, wc14_714, wc14_814, wc14_914, wc15_015, wc15_1015, wc15_1115, wc15_115, wc15_1215, 
      wc15_1315, wc15_1415, wc15_1515, wc15_1615, wc15_1715, wc15_1815, wc15_1915, wc15_2015, wc15_2115, wc15_215, 
      wc15_2215, wc15_2315, wc15_2415, wc15_2515, wc15_2615, wc15_2715, wc15_2815, wc15_2915, wc15_3015, wc15_3115, 
      wc15_315, wc15_415, wc15_515, wc15_615, wc15_715, wc15_815, wc15_915, wc16_016, wc16_1016, wc16_1116, 
      wc16_116, wc16_1216, wc16_1316, wc16_1416, wc16_1516, wc16_1616, wc16_1716, wc16_1816, wc16_1916, wc16_2016, 
      wc16_2116, wc16_216, wc16_2216, wc16_2316, wc16_2416, wc16_2516, wc16_2616, wc16_2716, wc16_2816, wc16_2916, 
      wc16_3016, wc16_3116, wc16_316, wc16_416, wc16_516, wc16_616, wc16_716, wc16_816, wc16_916, wc17_017, 
      wc17_1017, wc17_1117, wc17_117, wc17_1217, wc17_1317, wc17_1417, wc17_1517, wc17_1617, wc17_1717, wc17_1817, 
      wc17_1917, wc17_2017, wc17_2117, wc17_217, wc17_2217, wc17_2317, wc17_2417, wc17_2517, wc17_2617, wc17_2717, 
      wc17_2817, wc17_2917, wc17_3017, wc17_3117, wc17_317, wc17_417, wc17_517, wc17_617, wc17_717, wc17_817, 
      wc17_917, wc18_018, wc18_1018, wc18_1118, wc18_118, wc18_1218, wc18_1318, wc18_1418, wc18_1518, wc18_1618, 
      wc18_1718, wc18_1818, wc18_1918, wc18_2018, wc18_2118, wc18_218, wc18_2218, wc18_2318, wc18_2418, wc18_2518, 
      wc18_2618, wc18_2718, wc18_2818, wc18_2918, wc18_3018, wc18_3118, wc18_318, wc18_418, wc18_518, wc18_618, 
      wc18_718, wc18_818, wc18_918, wc19_019, wc19_1019, wc19_1119, wc19_119, wc19_1219, wc19_1319, wc19_1419, 
      wc19_1519, wc19_1619, wc19_1719, wc19_1819, wc19_1919, wc19_2019, wc19_2119, wc19_219, wc19_2219, wc19_2319, 
      wc19_2419, wc19_2519, wc19_2619, wc19_2719, wc19_2819, wc19_2919, wc19_3019, wc19_3119, wc19_319, wc19_419, 
      wc19_519, wc19_619, wc19_719, wc19_819, wc19_919, wc1_01, wc1_101, wc1_11, wc1_111, wc1_121, 
      wc1_131, wc1_141, wc1_151, wc1_161, wc1_171, wc1_181, wc1_191, wc1_201, wc1_21, wc1_211, 
      wc1_221, wc1_231, wc1_241, wc1_251, wc1_261, wc1_271, wc1_281, wc1_291, wc1_301, wc1_31, 
      wc1_311, wc1_41, wc1_51, wc1_61, wc1_71, wc1_81, wc1_91, wc20_020, wc20_1020, wc20_1120, 
      wc20_120, wc20_1220, wc20_1320, wc20_1420, wc20_1520, wc20_1620, wc20_1720, wc20_1820, wc20_1920, wc20_2020, 
      wc20_2120, wc20_220, wc20_2220, wc20_2320, wc20_2420, wc20_2520, wc20_2620, wc20_2720, wc20_2820, wc20_2920, 
      wc20_3020, wc20_3120, wc20_320, wc20_420, wc20_520, wc20_620, wc20_720, wc20_820, wc20_920, wc21_021, 
      wc21_1021, wc21_1121, wc21_121, wc21_1221, wc21_1321, wc21_1421, wc21_1521, wc21_1621, wc21_1721, wc21_1821, 
      wc21_1921, wc21_2021, wc21_2121, wc21_221, wc21_2221, wc21_2321, wc21_2421, wc21_2521, wc21_2621, wc21_2721, 
      wc21_2821, wc21_2921, wc21_3021, wc21_3121, wc21_321, wc21_421, wc21_521, wc21_621, wc21_721, wc21_821, 
      wc21_921, wc22_022, wc22_1022, wc22_1122, wc22_122, wc22_1222, wc22_1322, wc22_1422, wc22_1522, wc22_1622, 
      wc22_1722, wc22_1822, wc22_1922, wc22_2022, wc22_2122, wc22_222, wc22_2222, wc22_2322, wc22_2422, wc22_2522, 
      wc22_2622, wc22_2722, wc22_2822, wc22_2922, wc22_3022, wc22_3122, wc22_322, wc22_422, wc22_522, wc22_622, 
      wc22_722, wc22_822, wc22_922, wc23_023, wc23_1023, wc23_1123, wc23_1223, wc23_123, wc23_1323, wc23_1423, 
      wc23_1523, wc23_1623, wc23_1723, wc23_1823, wc23_1923, wc23_2023, wc23_2123, wc23_2223, wc23_223, wc23_2323, 
      wc23_2423, wc23_2523, wc23_2623, wc23_2723, wc23_2823, wc23_2923, wc23_3023, wc23_3123, wc23_323, wc23_423, 
      wc23_523, wc23_623, wc23_723, wc23_823, wc23_923, wc24_024, wc24_1024, wc24_1124, wc24_1224, wc24_124, 
      wc24_1324, wc24_1424, wc24_1524, wc24_1624, wc24_1724, wc24_1824, wc24_1924, wc24_2024, wc24_2124, wc24_2224, 
      wc24_224, wc24_2324, wc24_2424, wc24_2524, wc24_2624, wc24_2724, wc24_2824, wc24_2924, wc24_3024, wc24_3124, 
      wc24_324, wc24_424, wc24_524, wc24_624, wc24_724, wc24_824, wc24_924, wc25_025, wc25_1025, wc25_1125, 
      wc25_1225, wc25_125, wc25_1325, wc25_1425, wc25_1525, wc25_1625, wc25_1725, wc25_1825, wc25_1925, wc25_2025, 
      wc25_2125, wc25_2225, wc25_225, wc25_2325, wc25_2425, wc25_2525, wc25_2625, wc25_2725, wc25_2825, wc25_2925, 
      wc25_3025, wc25_3125, wc25_325, wc25_425, wc25_525, wc25_625, wc25_725, wc25_825, wc25_925, wc26_026, 
      wc26_1026, wc26_1126, wc26_1226, wc26_126, wc26_1326, wc26_1426, wc26_1526, wc26_1626, wc26_1726, wc26_1826, 
      wc26_1926, wc26_2026, wc26_2126, wc26_2226, wc26_226, wc26_2326, wc26_2426, wc26_2526, wc26_2626, wc26_2726, 
      wc26_2826, wc26_2926, wc26_3026, wc26_3126, wc26_326, wc26_426, wc26_526, wc26_626, wc26_726, wc26_826, 
      wc26_926, wc27_027, wc27_1027, wc27_1127, wc27_1227, wc27_127, wc27_1327, wc27_1427, wc27_1527, wc27_1627, 
      wc27_1727, wc27_1827, wc27_1927, wc27_2027, wc27_2127, wc27_2227, wc27_227, wc27_2327, wc27_2427, wc27_2527, 
      wc27_2627, wc27_2727, wc27_2827, wc27_2927, wc27_3027, wc27_3127, wc27_327, wc27_427, wc27_527, wc27_627, 
      wc27_727, wc27_827, wc27_927, wc28_028, wc28_1028, wc28_1128, wc28_1228, wc28_128, wc28_1328, wc28_1428, 
      wc28_1528, wc28_1628, wc28_1728, wc28_1828, wc28_1928, wc28_2028, wc28_2128, wc28_2228, wc28_228, wc28_2328, 
      wc28_2428, wc28_2528, wc28_2628, wc28_2728, wc28_2828, wc28_2928, wc28_3028, wc28_3128, wc28_328, wc28_428, 
      wc28_528, wc28_628, wc28_728, wc28_828, wc28_928, wc29_029, wc29_1029, wc29_1129, wc29_1229, wc29_129, 
      wc29_1329, wc29_1429, wc29_1529, wc29_1629, wc29_1729, wc29_1829, wc29_1929, wc29_2029, wc29_2129, wc29_2229, 
      wc29_229, wc29_2329, wc29_2429, wc29_2529, wc29_2629, wc29_2729, wc29_2829, wc29_2929, wc29_3029, wc29_3129, 
      wc29_329, wc29_429, wc29_529, wc29_629, wc29_729, wc29_829, wc29_929, wc2_02, wc2_102, wc2_112, 
      wc2_12, wc2_122, wc2_132, wc2_142, wc2_152, wc2_162, wc2_172, wc2_182, wc2_192, wc2_202, 
      wc2_212, wc2_22, wc2_222, wc2_232, wc2_242, wc2_252, wc2_262, wc2_272, wc2_282, wc2_292, 
      wc2_302, wc2_312, wc2_32, wc2_42, wc2_52, wc2_62, wc2_72, wc2_82, wc2_92, wc30_030, 
      wc30_1030, wc30_1130, wc30_1230, wc30_130, wc30_1330, wc30_1430, wc30_1530, wc30_1630, wc30_1730, wc30_1830, 
      wc30_1930, wc30_2030, wc30_2130, wc30_2230, wc30_230, wc30_2330, wc30_2430, wc30_2530, wc30_2630, wc30_2730, 
      wc30_2830, wc30_2930, wc30_3030, wc30_3130, wc30_330, wc30_430, wc30_530, wc30_630, wc30_730, wc30_830, 
      wc30_930, wc31_031, wc31_1031, wc31_1131, wc31_1231, wc31_131, wc31_1331, wc31_1431, wc31_1531, wc31_1631, 
      wc31_1731, wc31_1831, wc31_1931, wc31_2031, wc31_2131, wc31_2231, wc31_231, wc31_2331, wc31_2431, wc31_2531, 
      wc31_2631, wc31_2731, wc31_2831, wc31_2931, wc31_3031, wc31_3131, wc31_331, wc31_431, wc31_531, wc31_631, 
      wc31_731, wc31_831, wc31_931, wc3_03, wc3_103, wc3_113, wc3_123, wc3_13, wc3_133, wc3_143, 
      wc3_153, wc3_163, wc3_173, wc3_183, wc3_193, wc3_203, wc3_213, wc3_223, wc3_23, wc3_233, 
      wc3_243, wc3_253, wc3_263, wc3_273, wc3_283, wc3_293, wc3_303, wc3_313, wc3_33, wc3_43, 
      wc3_53, wc3_63, wc3_73, wc3_83, wc3_93, wc4_04, wc4_104, wc4_114, wc4_124, wc4_134, 
      wc4_14, wc4_144, wc4_154, wc4_164, wc4_174, wc4_184, wc4_194, wc4_204, wc4_214, wc4_224, 
      wc4_234, wc4_24, wc4_244, wc4_254, wc4_264, wc4_274, wc4_284, wc4_294, wc4_304, wc4_314, 
      wc4_34, wc4_44, wc4_54, wc4_64, wc4_74, wc4_84, wc4_94, wc5_05, wc5_105, wc5_115, 
      wc5_125, wc5_135, wc5_145, wc5_15, wc5_155, wc5_165, wc5_175, wc5_185, wc5_195, wc5_205, 
      wc5_215, wc5_225, wc5_235, wc5_245, wc5_25, wc5_255, wc5_265, wc5_275, wc5_285, wc5_295, 
      wc5_305, wc5_315, wc5_35, wc5_45, wc5_55, wc5_65, wc5_75, wc5_85, wc5_95, wc6_06, 
      wc6_106, wc6_116, wc6_126, wc6_136, wc6_146, wc6_156, wc6_16, wc6_166, wc6_176, wc6_186, 
      wc6_196, wc6_206, wc6_216, wc6_226, wc6_236, wc6_246, wc6_256, wc6_26, wc6_266, wc6_276, 
      wc6_286, wc6_296, wc6_306, wc6_316, wc6_36, wc6_46, wc6_56, wc6_66, wc6_76, wc6_86, 
      wc6_96, wc7_07, wc7_107, wc7_117, wc7_127, wc7_137, wc7_147, wc7_157, wc7_167, wc7_17, 
      wc7_177, wc7_187, wc7_197, wc7_207, wc7_217, wc7_227, wc7_237, wc7_247, wc7_257, wc7_267, 
      wc7_27, wc7_277, wc7_287, wc7_297, wc7_307, wc7_317, wc7_37, wc7_47, wc7_57, wc7_67, 
      wc7_77, wc7_87, wc7_97, wc8_08, wc8_108, wc8_118, wc8_128, wc8_138, wc8_148, wc8_158, 
      wc8_168, wc8_178, wc8_18, wc8_188, wc8_198, wc8_208, wc8_218, wc8_228, wc8_238, wc8_248, 
      wc8_258, wc8_268, wc8_278, wc8_28, wc8_288, wc8_298, wc8_308, wc8_318, wc8_38, wc8_48, 
      wc8_58, wc8_68, wc8_78, wc8_88, wc8_98, wc9_09, wc9_109, wc9_119, wc9_129, wc9_139, 
      wc9_149, wc9_159, wc9_169, wc9_179, wc9_189, wc9_19, wc9_199, wc9_209, wc9_219, wc9_229, 
      wc9_239, wc9_249, wc9_259, wc9_269, wc9_279, wc9_289, wc9_29, wc9_299, wc9_309, wc9_319, 
      wc9_39, wc9_49, wc9_59, wc9_69, wc9_79, wc9_89, wc9_99;

    wire wcFINAL;
// Wallace Tree Creator
assign w0_00 = data_A[0] & data_B[0];
assign w0_10 = data_A[1] & data_B[0];
assign w0_20 = data_A[2] & data_B[0];
assign w0_30 = data_A[3] & data_B[0];
assign w0_40 = data_A[4] & data_B[0];
assign w0_50 = data_A[5] & data_B[0];
assign w0_60 = data_A[6] & data_B[0];
assign w0_70 = data_A[7] & data_B[0];
assign w0_80 = data_A[8] & data_B[0];
assign w0_90 = data_A[9] & data_B[0];
assign w0_100 = data_A[10] & data_B[0];
assign w0_110 = data_A[11] & data_B[0];
assign w0_120 = data_A[12] & data_B[0];
assign w0_130 = data_A[13] & data_B[0];
assign w0_140 = data_A[14] & data_B[0];
assign w0_150 = data_A[15] & data_B[0];
assign w0_160 = data_A[16] & data_B[0];
assign w0_170 = data_A[17] & data_B[0];
assign w0_180 = data_A[18] & data_B[0];
assign w0_190 = data_A[19] & data_B[0];
assign w0_200 = data_A[20] & data_B[0];
assign w0_210 = data_A[21] & data_B[0];
assign w0_220 = data_A[22] & data_B[0];
assign w0_230 = data_A[23] & data_B[0];
assign w0_240 = data_A[24] & data_B[0];
assign w0_250 = data_A[25] & data_B[0];
assign w0_260 = data_A[26] & data_B[0];
assign w0_270 = data_A[27] & data_B[0];
assign w0_280 = data_A[28] & data_B[0];
assign w0_290 = data_A[29] & data_B[0];
assign w0_300 = data_A[30] & data_B[0];
assign w0_310 = ~(data_A[31] & data_B[0]);
assign mult_out[0] = w0_00;
assign wc0_310 = 1'b1;
half_adder half_adder1_0(.a(data_A[0] & data_B[1]), .b(w0_10), .s(w1_01), .cout(wc1_01));
full_adder full_adder1_1(.a(data_A[1] & data_B[1]),.b(w0_20), .cin(wc1_01), .s(w1_11), .cout(wc1_11));
full_adder full_adder1_2(.a(data_A[2] & data_B[1]),.b(w0_30), .cin(wc1_11), .s(w1_21), .cout(wc1_21));
full_adder full_adder1_3(.a(data_A[3] & data_B[1]),.b(w0_40), .cin(wc1_21), .s(w1_31), .cout(wc1_31));
full_adder full_adder1_4(.a(data_A[4] & data_B[1]),.b(w0_50), .cin(wc1_31), .s(w1_41), .cout(wc1_41));
full_adder full_adder1_5(.a(data_A[5] & data_B[1]),.b(w0_60), .cin(wc1_41), .s(w1_51), .cout(wc1_51));
full_adder full_adder1_6(.a(data_A[6] & data_B[1]),.b(w0_70), .cin(wc1_51), .s(w1_61), .cout(wc1_61));
full_adder full_adder1_7(.a(data_A[7] & data_B[1]),.b(w0_80), .cin(wc1_61), .s(w1_71), .cout(wc1_71));
full_adder full_adder1_8(.a(data_A[8] & data_B[1]),.b(w0_90), .cin(wc1_71), .s(w1_81), .cout(wc1_81));
full_adder full_adder1_9(.a(data_A[9] & data_B[1]),.b(w0_100), .cin(wc1_81), .s(w1_91), .cout(wc1_91));
full_adder full_adder1_10(.a(data_A[10] & data_B[1]),.b(w0_110), .cin(wc1_91), .s(w1_101), .cout(wc1_101));
full_adder full_adder1_11(.a(data_A[11] & data_B[1]),.b(w0_120), .cin(wc1_101), .s(w1_111), .cout(wc1_111));
full_adder full_adder1_12(.a(data_A[12] & data_B[1]),.b(w0_130), .cin(wc1_111), .s(w1_121), .cout(wc1_121));
full_adder full_adder1_13(.a(data_A[13] & data_B[1]),.b(w0_140), .cin(wc1_121), .s(w1_131), .cout(wc1_131));
full_adder full_adder1_14(.a(data_A[14] & data_B[1]),.b(w0_150), .cin(wc1_131), .s(w1_141), .cout(wc1_141));
full_adder full_adder1_15(.a(data_A[15] & data_B[1]),.b(w0_160), .cin(wc1_141), .s(w1_151), .cout(wc1_151));
full_adder full_adder1_16(.a(data_A[16] & data_B[1]),.b(w0_170), .cin(wc1_151), .s(w1_161), .cout(wc1_161));
full_adder full_adder1_17(.a(data_A[17] & data_B[1]),.b(w0_180), .cin(wc1_161), .s(w1_171), .cout(wc1_171));
full_adder full_adder1_18(.a(data_A[18] & data_B[1]),.b(w0_190), .cin(wc1_171), .s(w1_181), .cout(wc1_181));
full_adder full_adder1_19(.a(data_A[19] & data_B[1]),.b(w0_200), .cin(wc1_181), .s(w1_191), .cout(wc1_191));
full_adder full_adder1_20(.a(data_A[20] & data_B[1]),.b(w0_210), .cin(wc1_191), .s(w1_201), .cout(wc1_201));
full_adder full_adder1_21(.a(data_A[21] & data_B[1]),.b(w0_220), .cin(wc1_201), .s(w1_211), .cout(wc1_211));
full_adder full_adder1_22(.a(data_A[22] & data_B[1]),.b(w0_230), .cin(wc1_211), .s(w1_221), .cout(wc1_221));
full_adder full_adder1_23(.a(data_A[23] & data_B[1]),.b(w0_240), .cin(wc1_221), .s(w1_231), .cout(wc1_231));
full_adder full_adder1_24(.a(data_A[24] & data_B[1]),.b(w0_250), .cin(wc1_231), .s(w1_241), .cout(wc1_241));
full_adder full_adder1_25(.a(data_A[25] & data_B[1]),.b(w0_260), .cin(wc1_241), .s(w1_251), .cout(wc1_251));
full_adder full_adder1_26(.a(data_A[26] & data_B[1]),.b(w0_270), .cin(wc1_251), .s(w1_261), .cout(wc1_261));
full_adder full_adder1_27(.a(data_A[27] & data_B[1]),.b(w0_280), .cin(wc1_261), .s(w1_271), .cout(wc1_271));
full_adder full_adder1_28(.a(data_A[28] & data_B[1]),.b(w0_290), .cin(wc1_271), .s(w1_281), .cout(wc1_281));
full_adder full_adder1_29(.a(data_A[29] & data_B[1]),.b(w0_300), .cin(wc1_281), .s(w1_291), .cout(wc1_291));
full_adder full_adder1_30(.a(data_A[30] & data_B[1]),.b(w0_310), .cin(wc1_291), .s(w1_301), .cout(wc1_301));
full_adder full_adder1_31(.a(~(data_A[31] & data_B[1])),.b(wc0_310), .cin(wc1_301), .s(w1_311), .cout(wc1_311));
assign mult_out[1] = w1_01;
half_adder half_adder2_0(.a(data_A[0] & data_B[2]), .b(w1_11), .s(w2_02), .cout(wc2_02));
full_adder full_adder2_1(.a(data_A[1] & data_B[2]),.b(w1_21), .cin(wc2_02), .s(w2_12), .cout(wc2_12));
full_adder full_adder2_2(.a(data_A[2] & data_B[2]),.b(w1_31), .cin(wc2_12), .s(w2_22), .cout(wc2_22));
full_adder full_adder2_3(.a(data_A[3] & data_B[2]),.b(w1_41), .cin(wc2_22), .s(w2_32), .cout(wc2_32));
full_adder full_adder2_4(.a(data_A[4] & data_B[2]),.b(w1_51), .cin(wc2_32), .s(w2_42), .cout(wc2_42));
full_adder full_adder2_5(.a(data_A[5] & data_B[2]),.b(w1_61), .cin(wc2_42), .s(w2_52), .cout(wc2_52));
full_adder full_adder2_6(.a(data_A[6] & data_B[2]),.b(w1_71), .cin(wc2_52), .s(w2_62), .cout(wc2_62));
full_adder full_adder2_7(.a(data_A[7] & data_B[2]),.b(w1_81), .cin(wc2_62), .s(w2_72), .cout(wc2_72));
full_adder full_adder2_8(.a(data_A[8] & data_B[2]),.b(w1_91), .cin(wc2_72), .s(w2_82), .cout(wc2_82));
full_adder full_adder2_9(.a(data_A[9] & data_B[2]),.b(w1_101), .cin(wc2_82), .s(w2_92), .cout(wc2_92));
full_adder full_adder2_10(.a(data_A[10] & data_B[2]),.b(w1_111), .cin(wc2_92), .s(w2_102), .cout(wc2_102));
full_adder full_adder2_11(.a(data_A[11] & data_B[2]),.b(w1_121), .cin(wc2_102), .s(w2_112), .cout(wc2_112));
full_adder full_adder2_12(.a(data_A[12] & data_B[2]),.b(w1_131), .cin(wc2_112), .s(w2_122), .cout(wc2_122));
full_adder full_adder2_13(.a(data_A[13] & data_B[2]),.b(w1_141), .cin(wc2_122), .s(w2_132), .cout(wc2_132));
full_adder full_adder2_14(.a(data_A[14] & data_B[2]),.b(w1_151), .cin(wc2_132), .s(w2_142), .cout(wc2_142));
full_adder full_adder2_15(.a(data_A[15] & data_B[2]),.b(w1_161), .cin(wc2_142), .s(w2_152), .cout(wc2_152));
full_adder full_adder2_16(.a(data_A[16] & data_B[2]),.b(w1_171), .cin(wc2_152), .s(w2_162), .cout(wc2_162));
full_adder full_adder2_17(.a(data_A[17] & data_B[2]),.b(w1_181), .cin(wc2_162), .s(w2_172), .cout(wc2_172));
full_adder full_adder2_18(.a(data_A[18] & data_B[2]),.b(w1_191), .cin(wc2_172), .s(w2_182), .cout(wc2_182));
full_adder full_adder2_19(.a(data_A[19] & data_B[2]),.b(w1_201), .cin(wc2_182), .s(w2_192), .cout(wc2_192));
full_adder full_adder2_20(.a(data_A[20] & data_B[2]),.b(w1_211), .cin(wc2_192), .s(w2_202), .cout(wc2_202));
full_adder full_adder2_21(.a(data_A[21] & data_B[2]),.b(w1_221), .cin(wc2_202), .s(w2_212), .cout(wc2_212));
full_adder full_adder2_22(.a(data_A[22] & data_B[2]),.b(w1_231), .cin(wc2_212), .s(w2_222), .cout(wc2_222));
full_adder full_adder2_23(.a(data_A[23] & data_B[2]),.b(w1_241), .cin(wc2_222), .s(w2_232), .cout(wc2_232));
full_adder full_adder2_24(.a(data_A[24] & data_B[2]),.b(w1_251), .cin(wc2_232), .s(w2_242), .cout(wc2_242));
full_adder full_adder2_25(.a(data_A[25] & data_B[2]),.b(w1_261), .cin(wc2_242), .s(w2_252), .cout(wc2_252));
full_adder full_adder2_26(.a(data_A[26] & data_B[2]),.b(w1_271), .cin(wc2_252), .s(w2_262), .cout(wc2_262));
full_adder full_adder2_27(.a(data_A[27] & data_B[2]),.b(w1_281), .cin(wc2_262), .s(w2_272), .cout(wc2_272));
full_adder full_adder2_28(.a(data_A[28] & data_B[2]),.b(w1_291), .cin(wc2_272), .s(w2_282), .cout(wc2_282));
full_adder full_adder2_29(.a(data_A[29] & data_B[2]),.b(w1_301), .cin(wc2_282), .s(w2_292), .cout(wc2_292));
full_adder full_adder2_30(.a(data_A[30] & data_B[2]),.b(w1_311), .cin(wc2_292), .s(w2_302), .cout(wc2_302));
full_adder full_adder2_31(.a(~(data_A[31] & data_B[2])),.b(wc1_311), .cin(wc2_302), .s(w2_312), .cout(wc2_312));
assign mult_out[2] = w2_02;
half_adder half_adder3_0(.a(data_A[0] & data_B[3]), .b(w2_12), .s(w3_03), .cout(wc3_03));
full_adder full_adder3_1(.a(data_A[1] & data_B[3]),.b(w2_22), .cin(wc3_03), .s(w3_13), .cout(wc3_13));
full_adder full_adder3_2(.a(data_A[2] & data_B[3]),.b(w2_32), .cin(wc3_13), .s(w3_23), .cout(wc3_23));
full_adder full_adder3_3(.a(data_A[3] & data_B[3]),.b(w2_42), .cin(wc3_23), .s(w3_33), .cout(wc3_33));
full_adder full_adder3_4(.a(data_A[4] & data_B[3]),.b(w2_52), .cin(wc3_33), .s(w3_43), .cout(wc3_43));
full_adder full_adder3_5(.a(data_A[5] & data_B[3]),.b(w2_62), .cin(wc3_43), .s(w3_53), .cout(wc3_53));
full_adder full_adder3_6(.a(data_A[6] & data_B[3]),.b(w2_72), .cin(wc3_53), .s(w3_63), .cout(wc3_63));
full_adder full_adder3_7(.a(data_A[7] & data_B[3]),.b(w2_82), .cin(wc3_63), .s(w3_73), .cout(wc3_73));
full_adder full_adder3_8(.a(data_A[8] & data_B[3]),.b(w2_92), .cin(wc3_73), .s(w3_83), .cout(wc3_83));
full_adder full_adder3_9(.a(data_A[9] & data_B[3]),.b(w2_102), .cin(wc3_83), .s(w3_93), .cout(wc3_93));
full_adder full_adder3_10(.a(data_A[10] & data_B[3]),.b(w2_112), .cin(wc3_93), .s(w3_103), .cout(wc3_103));
full_adder full_adder3_11(.a(data_A[11] & data_B[3]),.b(w2_122), .cin(wc3_103), .s(w3_113), .cout(wc3_113));
full_adder full_adder3_12(.a(data_A[12] & data_B[3]),.b(w2_132), .cin(wc3_113), .s(w3_123), .cout(wc3_123));
full_adder full_adder3_13(.a(data_A[13] & data_B[3]),.b(w2_142), .cin(wc3_123), .s(w3_133), .cout(wc3_133));
full_adder full_adder3_14(.a(data_A[14] & data_B[3]),.b(w2_152), .cin(wc3_133), .s(w3_143), .cout(wc3_143));
full_adder full_adder3_15(.a(data_A[15] & data_B[3]),.b(w2_162), .cin(wc3_143), .s(w3_153), .cout(wc3_153));
full_adder full_adder3_16(.a(data_A[16] & data_B[3]),.b(w2_172), .cin(wc3_153), .s(w3_163), .cout(wc3_163));
full_adder full_adder3_17(.a(data_A[17] & data_B[3]),.b(w2_182), .cin(wc3_163), .s(w3_173), .cout(wc3_173));
full_adder full_adder3_18(.a(data_A[18] & data_B[3]),.b(w2_192), .cin(wc3_173), .s(w3_183), .cout(wc3_183));
full_adder full_adder3_19(.a(data_A[19] & data_B[3]),.b(w2_202), .cin(wc3_183), .s(w3_193), .cout(wc3_193));
full_adder full_adder3_20(.a(data_A[20] & data_B[3]),.b(w2_212), .cin(wc3_193), .s(w3_203), .cout(wc3_203));
full_adder full_adder3_21(.a(data_A[21] & data_B[3]),.b(w2_222), .cin(wc3_203), .s(w3_213), .cout(wc3_213));
full_adder full_adder3_22(.a(data_A[22] & data_B[3]),.b(w2_232), .cin(wc3_213), .s(w3_223), .cout(wc3_223));
full_adder full_adder3_23(.a(data_A[23] & data_B[3]),.b(w2_242), .cin(wc3_223), .s(w3_233), .cout(wc3_233));
full_adder full_adder3_24(.a(data_A[24] & data_B[3]),.b(w2_252), .cin(wc3_233), .s(w3_243), .cout(wc3_243));
full_adder full_adder3_25(.a(data_A[25] & data_B[3]),.b(w2_262), .cin(wc3_243), .s(w3_253), .cout(wc3_253));
full_adder full_adder3_26(.a(data_A[26] & data_B[3]),.b(w2_272), .cin(wc3_253), .s(w3_263), .cout(wc3_263));
full_adder full_adder3_27(.a(data_A[27] & data_B[3]),.b(w2_282), .cin(wc3_263), .s(w3_273), .cout(wc3_273));
full_adder full_adder3_28(.a(data_A[28] & data_B[3]),.b(w2_292), .cin(wc3_273), .s(w3_283), .cout(wc3_283));
full_adder full_adder3_29(.a(data_A[29] & data_B[3]),.b(w2_302), .cin(wc3_283), .s(w3_293), .cout(wc3_293));
full_adder full_adder3_30(.a(data_A[30] & data_B[3]),.b(w2_312), .cin(wc3_293), .s(w3_303), .cout(wc3_303));
full_adder full_adder3_31(.a(~(data_A[31] & data_B[3])),.b(wc2_312), .cin(wc3_303), .s(w3_313), .cout(wc3_313));
assign mult_out[3] = w3_03;
half_adder half_adder4_0(.a(data_A[0] & data_B[4]), .b(w3_13), .s(w4_04), .cout(wc4_04));
full_adder full_adder4_1(.a(data_A[1] & data_B[4]),.b(w3_23), .cin(wc4_04), .s(w4_14), .cout(wc4_14));
full_adder full_adder4_2(.a(data_A[2] & data_B[4]),.b(w3_33), .cin(wc4_14), .s(w4_24), .cout(wc4_24));
full_adder full_adder4_3(.a(data_A[3] & data_B[4]),.b(w3_43), .cin(wc4_24), .s(w4_34), .cout(wc4_34));
full_adder full_adder4_4(.a(data_A[4] & data_B[4]),.b(w3_53), .cin(wc4_34), .s(w4_44), .cout(wc4_44));
full_adder full_adder4_5(.a(data_A[5] & data_B[4]),.b(w3_63), .cin(wc4_44), .s(w4_54), .cout(wc4_54));
full_adder full_adder4_6(.a(data_A[6] & data_B[4]),.b(w3_73), .cin(wc4_54), .s(w4_64), .cout(wc4_64));
full_adder full_adder4_7(.a(data_A[7] & data_B[4]),.b(w3_83), .cin(wc4_64), .s(w4_74), .cout(wc4_74));
full_adder full_adder4_8(.a(data_A[8] & data_B[4]),.b(w3_93), .cin(wc4_74), .s(w4_84), .cout(wc4_84));
full_adder full_adder4_9(.a(data_A[9] & data_B[4]),.b(w3_103), .cin(wc4_84), .s(w4_94), .cout(wc4_94));
full_adder full_adder4_10(.a(data_A[10] & data_B[4]),.b(w3_113), .cin(wc4_94), .s(w4_104), .cout(wc4_104));
full_adder full_adder4_11(.a(data_A[11] & data_B[4]),.b(w3_123), .cin(wc4_104), .s(w4_114), .cout(wc4_114));
full_adder full_adder4_12(.a(data_A[12] & data_B[4]),.b(w3_133), .cin(wc4_114), .s(w4_124), .cout(wc4_124));
full_adder full_adder4_13(.a(data_A[13] & data_B[4]),.b(w3_143), .cin(wc4_124), .s(w4_134), .cout(wc4_134));
full_adder full_adder4_14(.a(data_A[14] & data_B[4]),.b(w3_153), .cin(wc4_134), .s(w4_144), .cout(wc4_144));
full_adder full_adder4_15(.a(data_A[15] & data_B[4]),.b(w3_163), .cin(wc4_144), .s(w4_154), .cout(wc4_154));
full_adder full_adder4_16(.a(data_A[16] & data_B[4]),.b(w3_173), .cin(wc4_154), .s(w4_164), .cout(wc4_164));
full_adder full_adder4_17(.a(data_A[17] & data_B[4]),.b(w3_183), .cin(wc4_164), .s(w4_174), .cout(wc4_174));
full_adder full_adder4_18(.a(data_A[18] & data_B[4]),.b(w3_193), .cin(wc4_174), .s(w4_184), .cout(wc4_184));
full_adder full_adder4_19(.a(data_A[19] & data_B[4]),.b(w3_203), .cin(wc4_184), .s(w4_194), .cout(wc4_194));
full_adder full_adder4_20(.a(data_A[20] & data_B[4]),.b(w3_213), .cin(wc4_194), .s(w4_204), .cout(wc4_204));
full_adder full_adder4_21(.a(data_A[21] & data_B[4]),.b(w3_223), .cin(wc4_204), .s(w4_214), .cout(wc4_214));
full_adder full_adder4_22(.a(data_A[22] & data_B[4]),.b(w3_233), .cin(wc4_214), .s(w4_224), .cout(wc4_224));
full_adder full_adder4_23(.a(data_A[23] & data_B[4]),.b(w3_243), .cin(wc4_224), .s(w4_234), .cout(wc4_234));
full_adder full_adder4_24(.a(data_A[24] & data_B[4]),.b(w3_253), .cin(wc4_234), .s(w4_244), .cout(wc4_244));
full_adder full_adder4_25(.a(data_A[25] & data_B[4]),.b(w3_263), .cin(wc4_244), .s(w4_254), .cout(wc4_254));
full_adder full_adder4_26(.a(data_A[26] & data_B[4]),.b(w3_273), .cin(wc4_254), .s(w4_264), .cout(wc4_264));
full_adder full_adder4_27(.a(data_A[27] & data_B[4]),.b(w3_283), .cin(wc4_264), .s(w4_274), .cout(wc4_274));
full_adder full_adder4_28(.a(data_A[28] & data_B[4]),.b(w3_293), .cin(wc4_274), .s(w4_284), .cout(wc4_284));
full_adder full_adder4_29(.a(data_A[29] & data_B[4]),.b(w3_303), .cin(wc4_284), .s(w4_294), .cout(wc4_294));
full_adder full_adder4_30(.a(data_A[30] & data_B[4]),.b(w3_313), .cin(wc4_294), .s(w4_304), .cout(wc4_304));
full_adder full_adder4_31(.a(~(data_A[31] & data_B[4])),.b(wc3_313), .cin(wc4_304), .s(w4_314), .cout(wc4_314));
assign mult_out[4] = w4_04;
half_adder half_adder5_0(.a(data_A[0] & data_B[5]), .b(w4_14), .s(w5_05), .cout(wc5_05));
full_adder full_adder5_1(.a(data_A[1] & data_B[5]),.b(w4_24), .cin(wc5_05), .s(w5_15), .cout(wc5_15));
full_adder full_adder5_2(.a(data_A[2] & data_B[5]),.b(w4_34), .cin(wc5_15), .s(w5_25), .cout(wc5_25));
full_adder full_adder5_3(.a(data_A[3] & data_B[5]),.b(w4_44), .cin(wc5_25), .s(w5_35), .cout(wc5_35));
full_adder full_adder5_4(.a(data_A[4] & data_B[5]),.b(w4_54), .cin(wc5_35), .s(w5_45), .cout(wc5_45));
full_adder full_adder5_5(.a(data_A[5] & data_B[5]),.b(w4_64), .cin(wc5_45), .s(w5_55), .cout(wc5_55));
full_adder full_adder5_6(.a(data_A[6] & data_B[5]),.b(w4_74), .cin(wc5_55), .s(w5_65), .cout(wc5_65));
full_adder full_adder5_7(.a(data_A[7] & data_B[5]),.b(w4_84), .cin(wc5_65), .s(w5_75), .cout(wc5_75));
full_adder full_adder5_8(.a(data_A[8] & data_B[5]),.b(w4_94), .cin(wc5_75), .s(w5_85), .cout(wc5_85));
full_adder full_adder5_9(.a(data_A[9] & data_B[5]),.b(w4_104), .cin(wc5_85), .s(w5_95), .cout(wc5_95));
full_adder full_adder5_10(.a(data_A[10] & data_B[5]),.b(w4_114), .cin(wc5_95), .s(w5_105), .cout(wc5_105));
full_adder full_adder5_11(.a(data_A[11] & data_B[5]),.b(w4_124), .cin(wc5_105), .s(w5_115), .cout(wc5_115));
full_adder full_adder5_12(.a(data_A[12] & data_B[5]),.b(w4_134), .cin(wc5_115), .s(w5_125), .cout(wc5_125));
full_adder full_adder5_13(.a(data_A[13] & data_B[5]),.b(w4_144), .cin(wc5_125), .s(w5_135), .cout(wc5_135));
full_adder full_adder5_14(.a(data_A[14] & data_B[5]),.b(w4_154), .cin(wc5_135), .s(w5_145), .cout(wc5_145));
full_adder full_adder5_15(.a(data_A[15] & data_B[5]),.b(w4_164), .cin(wc5_145), .s(w5_155), .cout(wc5_155));
full_adder full_adder5_16(.a(data_A[16] & data_B[5]),.b(w4_174), .cin(wc5_155), .s(w5_165), .cout(wc5_165));
full_adder full_adder5_17(.a(data_A[17] & data_B[5]),.b(w4_184), .cin(wc5_165), .s(w5_175), .cout(wc5_175));
full_adder full_adder5_18(.a(data_A[18] & data_B[5]),.b(w4_194), .cin(wc5_175), .s(w5_185), .cout(wc5_185));
full_adder full_adder5_19(.a(data_A[19] & data_B[5]),.b(w4_204), .cin(wc5_185), .s(w5_195), .cout(wc5_195));
full_adder full_adder5_20(.a(data_A[20] & data_B[5]),.b(w4_214), .cin(wc5_195), .s(w5_205), .cout(wc5_205));
full_adder full_adder5_21(.a(data_A[21] & data_B[5]),.b(w4_224), .cin(wc5_205), .s(w5_215), .cout(wc5_215));
full_adder full_adder5_22(.a(data_A[22] & data_B[5]),.b(w4_234), .cin(wc5_215), .s(w5_225), .cout(wc5_225));
full_adder full_adder5_23(.a(data_A[23] & data_B[5]),.b(w4_244), .cin(wc5_225), .s(w5_235), .cout(wc5_235));
full_adder full_adder5_24(.a(data_A[24] & data_B[5]),.b(w4_254), .cin(wc5_235), .s(w5_245), .cout(wc5_245));
full_adder full_adder5_25(.a(data_A[25] & data_B[5]),.b(w4_264), .cin(wc5_245), .s(w5_255), .cout(wc5_255));
full_adder full_adder5_26(.a(data_A[26] & data_B[5]),.b(w4_274), .cin(wc5_255), .s(w5_265), .cout(wc5_265));
full_adder full_adder5_27(.a(data_A[27] & data_B[5]),.b(w4_284), .cin(wc5_265), .s(w5_275), .cout(wc5_275));
full_adder full_adder5_28(.a(data_A[28] & data_B[5]),.b(w4_294), .cin(wc5_275), .s(w5_285), .cout(wc5_285));
full_adder full_adder5_29(.a(data_A[29] & data_B[5]),.b(w4_304), .cin(wc5_285), .s(w5_295), .cout(wc5_295));
full_adder full_adder5_30(.a(data_A[30] & data_B[5]),.b(w4_314), .cin(wc5_295), .s(w5_305), .cout(wc5_305));
full_adder full_adder5_31(.a(~(data_A[31] & data_B[5])),.b(wc4_314), .cin(wc5_305), .s(w5_315), .cout(wc5_315));
assign mult_out[5] = w5_05;
half_adder half_adder6_0(.a(data_A[0] & data_B[6]), .b(w5_15), .s(w6_06), .cout(wc6_06));
full_adder full_adder6_1(.a(data_A[1] & data_B[6]),.b(w5_25), .cin(wc6_06), .s(w6_16), .cout(wc6_16));
full_adder full_adder6_2(.a(data_A[2] & data_B[6]),.b(w5_35), .cin(wc6_16), .s(w6_26), .cout(wc6_26));
full_adder full_adder6_3(.a(data_A[3] & data_B[6]),.b(w5_45), .cin(wc6_26), .s(w6_36), .cout(wc6_36));
full_adder full_adder6_4(.a(data_A[4] & data_B[6]),.b(w5_55), .cin(wc6_36), .s(w6_46), .cout(wc6_46));
full_adder full_adder6_5(.a(data_A[5] & data_B[6]),.b(w5_65), .cin(wc6_46), .s(w6_56), .cout(wc6_56));
full_adder full_adder6_6(.a(data_A[6] & data_B[6]),.b(w5_75), .cin(wc6_56), .s(w6_66), .cout(wc6_66));
full_adder full_adder6_7(.a(data_A[7] & data_B[6]),.b(w5_85), .cin(wc6_66), .s(w6_76), .cout(wc6_76));
full_adder full_adder6_8(.a(data_A[8] & data_B[6]),.b(w5_95), .cin(wc6_76), .s(w6_86), .cout(wc6_86));
full_adder full_adder6_9(.a(data_A[9] & data_B[6]),.b(w5_105), .cin(wc6_86), .s(w6_96), .cout(wc6_96));
full_adder full_adder6_10(.a(data_A[10] & data_B[6]),.b(w5_115), .cin(wc6_96), .s(w6_106), .cout(wc6_106));
full_adder full_adder6_11(.a(data_A[11] & data_B[6]),.b(w5_125), .cin(wc6_106), .s(w6_116), .cout(wc6_116));
full_adder full_adder6_12(.a(data_A[12] & data_B[6]),.b(w5_135), .cin(wc6_116), .s(w6_126), .cout(wc6_126));
full_adder full_adder6_13(.a(data_A[13] & data_B[6]),.b(w5_145), .cin(wc6_126), .s(w6_136), .cout(wc6_136));
full_adder full_adder6_14(.a(data_A[14] & data_B[6]),.b(w5_155), .cin(wc6_136), .s(w6_146), .cout(wc6_146));
full_adder full_adder6_15(.a(data_A[15] & data_B[6]),.b(w5_165), .cin(wc6_146), .s(w6_156), .cout(wc6_156));
full_adder full_adder6_16(.a(data_A[16] & data_B[6]),.b(w5_175), .cin(wc6_156), .s(w6_166), .cout(wc6_166));
full_adder full_adder6_17(.a(data_A[17] & data_B[6]),.b(w5_185), .cin(wc6_166), .s(w6_176), .cout(wc6_176));
full_adder full_adder6_18(.a(data_A[18] & data_B[6]),.b(w5_195), .cin(wc6_176), .s(w6_186), .cout(wc6_186));
full_adder full_adder6_19(.a(data_A[19] & data_B[6]),.b(w5_205), .cin(wc6_186), .s(w6_196), .cout(wc6_196));
full_adder full_adder6_20(.a(data_A[20] & data_B[6]),.b(w5_215), .cin(wc6_196), .s(w6_206), .cout(wc6_206));
full_adder full_adder6_21(.a(data_A[21] & data_B[6]),.b(w5_225), .cin(wc6_206), .s(w6_216), .cout(wc6_216));
full_adder full_adder6_22(.a(data_A[22] & data_B[6]),.b(w5_235), .cin(wc6_216), .s(w6_226), .cout(wc6_226));
full_adder full_adder6_23(.a(data_A[23] & data_B[6]),.b(w5_245), .cin(wc6_226), .s(w6_236), .cout(wc6_236));
full_adder full_adder6_24(.a(data_A[24] & data_B[6]),.b(w5_255), .cin(wc6_236), .s(w6_246), .cout(wc6_246));
full_adder full_adder6_25(.a(data_A[25] & data_B[6]),.b(w5_265), .cin(wc6_246), .s(w6_256), .cout(wc6_256));
full_adder full_adder6_26(.a(data_A[26] & data_B[6]),.b(w5_275), .cin(wc6_256), .s(w6_266), .cout(wc6_266));
full_adder full_adder6_27(.a(data_A[27] & data_B[6]),.b(w5_285), .cin(wc6_266), .s(w6_276), .cout(wc6_276));
full_adder full_adder6_28(.a(data_A[28] & data_B[6]),.b(w5_295), .cin(wc6_276), .s(w6_286), .cout(wc6_286));
full_adder full_adder6_29(.a(data_A[29] & data_B[6]),.b(w5_305), .cin(wc6_286), .s(w6_296), .cout(wc6_296));
full_adder full_adder6_30(.a(data_A[30] & data_B[6]),.b(w5_315), .cin(wc6_296), .s(w6_306), .cout(wc6_306));
full_adder full_adder6_31(.a(~(data_A[31] & data_B[6])),.b(wc5_315), .cin(wc6_306), .s(w6_316), .cout(wc6_316));
assign mult_out[6] = w6_06;
half_adder half_adder7_0(.a(data_A[0] & data_B[7]), .b(w6_16), .s(w7_07), .cout(wc7_07));
full_adder full_adder7_1(.a(data_A[1] & data_B[7]),.b(w6_26), .cin(wc7_07), .s(w7_17), .cout(wc7_17));
full_adder full_adder7_2(.a(data_A[2] & data_B[7]),.b(w6_36), .cin(wc7_17), .s(w7_27), .cout(wc7_27));
full_adder full_adder7_3(.a(data_A[3] & data_B[7]),.b(w6_46), .cin(wc7_27), .s(w7_37), .cout(wc7_37));
full_adder full_adder7_4(.a(data_A[4] & data_B[7]),.b(w6_56), .cin(wc7_37), .s(w7_47), .cout(wc7_47));
full_adder full_adder7_5(.a(data_A[5] & data_B[7]),.b(w6_66), .cin(wc7_47), .s(w7_57), .cout(wc7_57));
full_adder full_adder7_6(.a(data_A[6] & data_B[7]),.b(w6_76), .cin(wc7_57), .s(w7_67), .cout(wc7_67));
full_adder full_adder7_7(.a(data_A[7] & data_B[7]),.b(w6_86), .cin(wc7_67), .s(w7_77), .cout(wc7_77));
full_adder full_adder7_8(.a(data_A[8] & data_B[7]),.b(w6_96), .cin(wc7_77), .s(w7_87), .cout(wc7_87));
full_adder full_adder7_9(.a(data_A[9] & data_B[7]),.b(w6_106), .cin(wc7_87), .s(w7_97), .cout(wc7_97));
full_adder full_adder7_10(.a(data_A[10] & data_B[7]),.b(w6_116), .cin(wc7_97), .s(w7_107), .cout(wc7_107));
full_adder full_adder7_11(.a(data_A[11] & data_B[7]),.b(w6_126), .cin(wc7_107), .s(w7_117), .cout(wc7_117));
full_adder full_adder7_12(.a(data_A[12] & data_B[7]),.b(w6_136), .cin(wc7_117), .s(w7_127), .cout(wc7_127));
full_adder full_adder7_13(.a(data_A[13] & data_B[7]),.b(w6_146), .cin(wc7_127), .s(w7_137), .cout(wc7_137));
full_adder full_adder7_14(.a(data_A[14] & data_B[7]),.b(w6_156), .cin(wc7_137), .s(w7_147), .cout(wc7_147));
full_adder full_adder7_15(.a(data_A[15] & data_B[7]),.b(w6_166), .cin(wc7_147), .s(w7_157), .cout(wc7_157));
full_adder full_adder7_16(.a(data_A[16] & data_B[7]),.b(w6_176), .cin(wc7_157), .s(w7_167), .cout(wc7_167));
full_adder full_adder7_17(.a(data_A[17] & data_B[7]),.b(w6_186), .cin(wc7_167), .s(w7_177), .cout(wc7_177));
full_adder full_adder7_18(.a(data_A[18] & data_B[7]),.b(w6_196), .cin(wc7_177), .s(w7_187), .cout(wc7_187));
full_adder full_adder7_19(.a(data_A[19] & data_B[7]),.b(w6_206), .cin(wc7_187), .s(w7_197), .cout(wc7_197));
full_adder full_adder7_20(.a(data_A[20] & data_B[7]),.b(w6_216), .cin(wc7_197), .s(w7_207), .cout(wc7_207));
full_adder full_adder7_21(.a(data_A[21] & data_B[7]),.b(w6_226), .cin(wc7_207), .s(w7_217), .cout(wc7_217));
full_adder full_adder7_22(.a(data_A[22] & data_B[7]),.b(w6_236), .cin(wc7_217), .s(w7_227), .cout(wc7_227));
full_adder full_adder7_23(.a(data_A[23] & data_B[7]),.b(w6_246), .cin(wc7_227), .s(w7_237), .cout(wc7_237));
full_adder full_adder7_24(.a(data_A[24] & data_B[7]),.b(w6_256), .cin(wc7_237), .s(w7_247), .cout(wc7_247));
full_adder full_adder7_25(.a(data_A[25] & data_B[7]),.b(w6_266), .cin(wc7_247), .s(w7_257), .cout(wc7_257));
full_adder full_adder7_26(.a(data_A[26] & data_B[7]),.b(w6_276), .cin(wc7_257), .s(w7_267), .cout(wc7_267));
full_adder full_adder7_27(.a(data_A[27] & data_B[7]),.b(w6_286), .cin(wc7_267), .s(w7_277), .cout(wc7_277));
full_adder full_adder7_28(.a(data_A[28] & data_B[7]),.b(w6_296), .cin(wc7_277), .s(w7_287), .cout(wc7_287));
full_adder full_adder7_29(.a(data_A[29] & data_B[7]),.b(w6_306), .cin(wc7_287), .s(w7_297), .cout(wc7_297));
full_adder full_adder7_30(.a(data_A[30] & data_B[7]),.b(w6_316), .cin(wc7_297), .s(w7_307), .cout(wc7_307));
full_adder full_adder7_31(.a(~(data_A[31] & data_B[7])),.b(wc6_316), .cin(wc7_307), .s(w7_317), .cout(wc7_317));
assign mult_out[7] = w7_07;
half_adder half_adder8_0(.a(data_A[0] & data_B[8]), .b(w7_17), .s(w8_08), .cout(wc8_08));
full_adder full_adder8_1(.a(data_A[1] & data_B[8]),.b(w7_27), .cin(wc8_08), .s(w8_18), .cout(wc8_18));
full_adder full_adder8_2(.a(data_A[2] & data_B[8]),.b(w7_37), .cin(wc8_18), .s(w8_28), .cout(wc8_28));
full_adder full_adder8_3(.a(data_A[3] & data_B[8]),.b(w7_47), .cin(wc8_28), .s(w8_38), .cout(wc8_38));
full_adder full_adder8_4(.a(data_A[4] & data_B[8]),.b(w7_57), .cin(wc8_38), .s(w8_48), .cout(wc8_48));
full_adder full_adder8_5(.a(data_A[5] & data_B[8]),.b(w7_67), .cin(wc8_48), .s(w8_58), .cout(wc8_58));
full_adder full_adder8_6(.a(data_A[6] & data_B[8]),.b(w7_77), .cin(wc8_58), .s(w8_68), .cout(wc8_68));
full_adder full_adder8_7(.a(data_A[7] & data_B[8]),.b(w7_87), .cin(wc8_68), .s(w8_78), .cout(wc8_78));
full_adder full_adder8_8(.a(data_A[8] & data_B[8]),.b(w7_97), .cin(wc8_78), .s(w8_88), .cout(wc8_88));
full_adder full_adder8_9(.a(data_A[9] & data_B[8]),.b(w7_107), .cin(wc8_88), .s(w8_98), .cout(wc8_98));
full_adder full_adder8_10(.a(data_A[10] & data_B[8]),.b(w7_117), .cin(wc8_98), .s(w8_108), .cout(wc8_108));
full_adder full_adder8_11(.a(data_A[11] & data_B[8]),.b(w7_127), .cin(wc8_108), .s(w8_118), .cout(wc8_118));
full_adder full_adder8_12(.a(data_A[12] & data_B[8]),.b(w7_137), .cin(wc8_118), .s(w8_128), .cout(wc8_128));
full_adder full_adder8_13(.a(data_A[13] & data_B[8]),.b(w7_147), .cin(wc8_128), .s(w8_138), .cout(wc8_138));
full_adder full_adder8_14(.a(data_A[14] & data_B[8]),.b(w7_157), .cin(wc8_138), .s(w8_148), .cout(wc8_148));
full_adder full_adder8_15(.a(data_A[15] & data_B[8]),.b(w7_167), .cin(wc8_148), .s(w8_158), .cout(wc8_158));
full_adder full_adder8_16(.a(data_A[16] & data_B[8]),.b(w7_177), .cin(wc8_158), .s(w8_168), .cout(wc8_168));
full_adder full_adder8_17(.a(data_A[17] & data_B[8]),.b(w7_187), .cin(wc8_168), .s(w8_178), .cout(wc8_178));
full_adder full_adder8_18(.a(data_A[18] & data_B[8]),.b(w7_197), .cin(wc8_178), .s(w8_188), .cout(wc8_188));
full_adder full_adder8_19(.a(data_A[19] & data_B[8]),.b(w7_207), .cin(wc8_188), .s(w8_198), .cout(wc8_198));
full_adder full_adder8_20(.a(data_A[20] & data_B[8]),.b(w7_217), .cin(wc8_198), .s(w8_208), .cout(wc8_208));
full_adder full_adder8_21(.a(data_A[21] & data_B[8]),.b(w7_227), .cin(wc8_208), .s(w8_218), .cout(wc8_218));
full_adder full_adder8_22(.a(data_A[22] & data_B[8]),.b(w7_237), .cin(wc8_218), .s(w8_228), .cout(wc8_228));
full_adder full_adder8_23(.a(data_A[23] & data_B[8]),.b(w7_247), .cin(wc8_228), .s(w8_238), .cout(wc8_238));
full_adder full_adder8_24(.a(data_A[24] & data_B[8]),.b(w7_257), .cin(wc8_238), .s(w8_248), .cout(wc8_248));
full_adder full_adder8_25(.a(data_A[25] & data_B[8]),.b(w7_267), .cin(wc8_248), .s(w8_258), .cout(wc8_258));
full_adder full_adder8_26(.a(data_A[26] & data_B[8]),.b(w7_277), .cin(wc8_258), .s(w8_268), .cout(wc8_268));
full_adder full_adder8_27(.a(data_A[27] & data_B[8]),.b(w7_287), .cin(wc8_268), .s(w8_278), .cout(wc8_278));
full_adder full_adder8_28(.a(data_A[28] & data_B[8]),.b(w7_297), .cin(wc8_278), .s(w8_288), .cout(wc8_288));
full_adder full_adder8_29(.a(data_A[29] & data_B[8]),.b(w7_307), .cin(wc8_288), .s(w8_298), .cout(wc8_298));
full_adder full_adder8_30(.a(data_A[30] & data_B[8]),.b(w7_317), .cin(wc8_298), .s(w8_308), .cout(wc8_308));
full_adder full_adder8_31(.a(~(data_A[31] & data_B[8])),.b(wc7_317), .cin(wc8_308), .s(w8_318), .cout(wc8_318));
assign mult_out[8] = w8_08;
half_adder half_adder9_0(.a(data_A[0] & data_B[9]), .b(w8_18), .s(w9_09), .cout(wc9_09));
full_adder full_adder9_1(.a(data_A[1] & data_B[9]),.b(w8_28), .cin(wc9_09), .s(w9_19), .cout(wc9_19));
full_adder full_adder9_2(.a(data_A[2] & data_B[9]),.b(w8_38), .cin(wc9_19), .s(w9_29), .cout(wc9_29));
full_adder full_adder9_3(.a(data_A[3] & data_B[9]),.b(w8_48), .cin(wc9_29), .s(w9_39), .cout(wc9_39));
full_adder full_adder9_4(.a(data_A[4] & data_B[9]),.b(w8_58), .cin(wc9_39), .s(w9_49), .cout(wc9_49));
full_adder full_adder9_5(.a(data_A[5] & data_B[9]),.b(w8_68), .cin(wc9_49), .s(w9_59), .cout(wc9_59));
full_adder full_adder9_6(.a(data_A[6] & data_B[9]),.b(w8_78), .cin(wc9_59), .s(w9_69), .cout(wc9_69));
full_adder full_adder9_7(.a(data_A[7] & data_B[9]),.b(w8_88), .cin(wc9_69), .s(w9_79), .cout(wc9_79));
full_adder full_adder9_8(.a(data_A[8] & data_B[9]),.b(w8_98), .cin(wc9_79), .s(w9_89), .cout(wc9_89));
full_adder full_adder9_9(.a(data_A[9] & data_B[9]),.b(w8_108), .cin(wc9_89), .s(w9_99), .cout(wc9_99));
full_adder full_adder9_10(.a(data_A[10] & data_B[9]),.b(w8_118), .cin(wc9_99), .s(w9_109), .cout(wc9_109));
full_adder full_adder9_11(.a(data_A[11] & data_B[9]),.b(w8_128), .cin(wc9_109), .s(w9_119), .cout(wc9_119));
full_adder full_adder9_12(.a(data_A[12] & data_B[9]),.b(w8_138), .cin(wc9_119), .s(w9_129), .cout(wc9_129));
full_adder full_adder9_13(.a(data_A[13] & data_B[9]),.b(w8_148), .cin(wc9_129), .s(w9_139), .cout(wc9_139));
full_adder full_adder9_14(.a(data_A[14] & data_B[9]),.b(w8_158), .cin(wc9_139), .s(w9_149), .cout(wc9_149));
full_adder full_adder9_15(.a(data_A[15] & data_B[9]),.b(w8_168), .cin(wc9_149), .s(w9_159), .cout(wc9_159));
full_adder full_adder9_16(.a(data_A[16] & data_B[9]),.b(w8_178), .cin(wc9_159), .s(w9_169), .cout(wc9_169));
full_adder full_adder9_17(.a(data_A[17] & data_B[9]),.b(w8_188), .cin(wc9_169), .s(w9_179), .cout(wc9_179));
full_adder full_adder9_18(.a(data_A[18] & data_B[9]),.b(w8_198), .cin(wc9_179), .s(w9_189), .cout(wc9_189));
full_adder full_adder9_19(.a(data_A[19] & data_B[9]),.b(w8_208), .cin(wc9_189), .s(w9_199), .cout(wc9_199));
full_adder full_adder9_20(.a(data_A[20] & data_B[9]),.b(w8_218), .cin(wc9_199), .s(w9_209), .cout(wc9_209));
full_adder full_adder9_21(.a(data_A[21] & data_B[9]),.b(w8_228), .cin(wc9_209), .s(w9_219), .cout(wc9_219));
full_adder full_adder9_22(.a(data_A[22] & data_B[9]),.b(w8_238), .cin(wc9_219), .s(w9_229), .cout(wc9_229));
full_adder full_adder9_23(.a(data_A[23] & data_B[9]),.b(w8_248), .cin(wc9_229), .s(w9_239), .cout(wc9_239));
full_adder full_adder9_24(.a(data_A[24] & data_B[9]),.b(w8_258), .cin(wc9_239), .s(w9_249), .cout(wc9_249));
full_adder full_adder9_25(.a(data_A[25] & data_B[9]),.b(w8_268), .cin(wc9_249), .s(w9_259), .cout(wc9_259));
full_adder full_adder9_26(.a(data_A[26] & data_B[9]),.b(w8_278), .cin(wc9_259), .s(w9_269), .cout(wc9_269));
full_adder full_adder9_27(.a(data_A[27] & data_B[9]),.b(w8_288), .cin(wc9_269), .s(w9_279), .cout(wc9_279));
full_adder full_adder9_28(.a(data_A[28] & data_B[9]),.b(w8_298), .cin(wc9_279), .s(w9_289), .cout(wc9_289));
full_adder full_adder9_29(.a(data_A[29] & data_B[9]),.b(w8_308), .cin(wc9_289), .s(w9_299), .cout(wc9_299));
full_adder full_adder9_30(.a(data_A[30] & data_B[9]),.b(w8_318), .cin(wc9_299), .s(w9_309), .cout(wc9_309));
full_adder full_adder9_31(.a(~(data_A[31] & data_B[9])),.b(wc8_318), .cin(wc9_309), .s(w9_319), .cout(wc9_319));
assign mult_out[9] = w9_09;
half_adder half_adder10_0(.a(data_A[0] & data_B[10]), .b(w9_19), .s(w10_010), .cout(wc10_010));
full_adder full_adder10_1(.a(data_A[1] & data_B[10]),.b(w9_29), .cin(wc10_010), .s(w10_110), .cout(wc10_110));
full_adder full_adder10_2(.a(data_A[2] & data_B[10]),.b(w9_39), .cin(wc10_110), .s(w10_210), .cout(wc10_210));
full_adder full_adder10_3(.a(data_A[3] & data_B[10]),.b(w9_49), .cin(wc10_210), .s(w10_310), .cout(wc10_310));
full_adder full_adder10_4(.a(data_A[4] & data_B[10]),.b(w9_59), .cin(wc10_310), .s(w10_410), .cout(wc10_410));
full_adder full_adder10_5(.a(data_A[5] & data_B[10]),.b(w9_69), .cin(wc10_410), .s(w10_510), .cout(wc10_510));
full_adder full_adder10_6(.a(data_A[6] & data_B[10]),.b(w9_79), .cin(wc10_510), .s(w10_610), .cout(wc10_610));
full_adder full_adder10_7(.a(data_A[7] & data_B[10]),.b(w9_89), .cin(wc10_610), .s(w10_710), .cout(wc10_710));
full_adder full_adder10_8(.a(data_A[8] & data_B[10]),.b(w9_99), .cin(wc10_710), .s(w10_810), .cout(wc10_810));
full_adder full_adder10_9(.a(data_A[9] & data_B[10]),.b(w9_109), .cin(wc10_810), .s(w10_910), .cout(wc10_910));
full_adder full_adder10_10(.a(data_A[10] & data_B[10]),.b(w9_119), .cin(wc10_910), .s(w10_1010), .cout(wc10_1010));
full_adder full_adder10_11(.a(data_A[11] & data_B[10]),.b(w9_129), .cin(wc10_1010), .s(w10_1110), .cout(wc10_1110));
full_adder full_adder10_12(.a(data_A[12] & data_B[10]),.b(w9_139), .cin(wc10_1110), .s(w10_1210), .cout(wc10_1210));
full_adder full_adder10_13(.a(data_A[13] & data_B[10]),.b(w9_149), .cin(wc10_1210), .s(w10_1310), .cout(wc10_1310));
full_adder full_adder10_14(.a(data_A[14] & data_B[10]),.b(w9_159), .cin(wc10_1310), .s(w10_1410), .cout(wc10_1410));
full_adder full_adder10_15(.a(data_A[15] & data_B[10]),.b(w9_169), .cin(wc10_1410), .s(w10_1510), .cout(wc10_1510));
full_adder full_adder10_16(.a(data_A[16] & data_B[10]),.b(w9_179), .cin(wc10_1510), .s(w10_1610), .cout(wc10_1610));
full_adder full_adder10_17(.a(data_A[17] & data_B[10]),.b(w9_189), .cin(wc10_1610), .s(w10_1710), .cout(wc10_1710));
full_adder full_adder10_18(.a(data_A[18] & data_B[10]),.b(w9_199), .cin(wc10_1710), .s(w10_1810), .cout(wc10_1810));
full_adder full_adder10_19(.a(data_A[19] & data_B[10]),.b(w9_209), .cin(wc10_1810), .s(w10_1910), .cout(wc10_1910));
full_adder full_adder10_20(.a(data_A[20] & data_B[10]),.b(w9_219), .cin(wc10_1910), .s(w10_2010), .cout(wc10_2010));
full_adder full_adder10_21(.a(data_A[21] & data_B[10]),.b(w9_229), .cin(wc10_2010), .s(w10_2110), .cout(wc10_2110));
full_adder full_adder10_22(.a(data_A[22] & data_B[10]),.b(w9_239), .cin(wc10_2110), .s(w10_2210), .cout(wc10_2210));
full_adder full_adder10_23(.a(data_A[23] & data_B[10]),.b(w9_249), .cin(wc10_2210), .s(w10_2310), .cout(wc10_2310));
full_adder full_adder10_24(.a(data_A[24] & data_B[10]),.b(w9_259), .cin(wc10_2310), .s(w10_2410), .cout(wc10_2410));
full_adder full_adder10_25(.a(data_A[25] & data_B[10]),.b(w9_269), .cin(wc10_2410), .s(w10_2510), .cout(wc10_2510));
full_adder full_adder10_26(.a(data_A[26] & data_B[10]),.b(w9_279), .cin(wc10_2510), .s(w10_2610), .cout(wc10_2610));
full_adder full_adder10_27(.a(data_A[27] & data_B[10]),.b(w9_289), .cin(wc10_2610), .s(w10_2710), .cout(wc10_2710));
full_adder full_adder10_28(.a(data_A[28] & data_B[10]),.b(w9_299), .cin(wc10_2710), .s(w10_2810), .cout(wc10_2810));
full_adder full_adder10_29(.a(data_A[29] & data_B[10]),.b(w9_309), .cin(wc10_2810), .s(w10_2910), .cout(wc10_2910));
full_adder full_adder10_30(.a(data_A[30] & data_B[10]),.b(w9_319), .cin(wc10_2910), .s(w10_3010), .cout(wc10_3010));
full_adder full_adder10_31(.a(~(data_A[31] & data_B[10])),.b(wc9_319), .cin(wc10_3010), .s(w10_3110), .cout(wc10_3110));
assign mult_out[10] = w10_010;
half_adder half_adder11_0(.a(data_A[0] & data_B[11]), .b(w10_110), .s(w11_011), .cout(wc11_011));
full_adder full_adder11_1(.a(data_A[1] & data_B[11]),.b(w10_210), .cin(wc11_011), .s(w11_111), .cout(wc11_111));
full_adder full_adder11_2(.a(data_A[2] & data_B[11]),.b(w10_310), .cin(wc11_111), .s(w11_211), .cout(wc11_211));
full_adder full_adder11_3(.a(data_A[3] & data_B[11]),.b(w10_410), .cin(wc11_211), .s(w11_311), .cout(wc11_311));
full_adder full_adder11_4(.a(data_A[4] & data_B[11]),.b(w10_510), .cin(wc11_311), .s(w11_411), .cout(wc11_411));
full_adder full_adder11_5(.a(data_A[5] & data_B[11]),.b(w10_610), .cin(wc11_411), .s(w11_511), .cout(wc11_511));
full_adder full_adder11_6(.a(data_A[6] & data_B[11]),.b(w10_710), .cin(wc11_511), .s(w11_611), .cout(wc11_611));
full_adder full_adder11_7(.a(data_A[7] & data_B[11]),.b(w10_810), .cin(wc11_611), .s(w11_711), .cout(wc11_711));
full_adder full_adder11_8(.a(data_A[8] & data_B[11]),.b(w10_910), .cin(wc11_711), .s(w11_811), .cout(wc11_811));
full_adder full_adder11_9(.a(data_A[9] & data_B[11]),.b(w10_1010), .cin(wc11_811), .s(w11_911), .cout(wc11_911));
full_adder full_adder11_10(.a(data_A[10] & data_B[11]),.b(w10_1110), .cin(wc11_911), .s(w11_1011), .cout(wc11_1011));
full_adder full_adder11_11(.a(data_A[11] & data_B[11]),.b(w10_1210), .cin(wc11_1011), .s(w11_1111), .cout(wc11_1111));
full_adder full_adder11_12(.a(data_A[12] & data_B[11]),.b(w10_1310), .cin(wc11_1111), .s(w11_1211), .cout(wc11_1211));
full_adder full_adder11_13(.a(data_A[13] & data_B[11]),.b(w10_1410), .cin(wc11_1211), .s(w11_1311), .cout(wc11_1311));
full_adder full_adder11_14(.a(data_A[14] & data_B[11]),.b(w10_1510), .cin(wc11_1311), .s(w11_1411), .cout(wc11_1411));
full_adder full_adder11_15(.a(data_A[15] & data_B[11]),.b(w10_1610), .cin(wc11_1411), .s(w11_1511), .cout(wc11_1511));
full_adder full_adder11_16(.a(data_A[16] & data_B[11]),.b(w10_1710), .cin(wc11_1511), .s(w11_1611), .cout(wc11_1611));
full_adder full_adder11_17(.a(data_A[17] & data_B[11]),.b(w10_1810), .cin(wc11_1611), .s(w11_1711), .cout(wc11_1711));
full_adder full_adder11_18(.a(data_A[18] & data_B[11]),.b(w10_1910), .cin(wc11_1711), .s(w11_1811), .cout(wc11_1811));
full_adder full_adder11_19(.a(data_A[19] & data_B[11]),.b(w10_2010), .cin(wc11_1811), .s(w11_1911), .cout(wc11_1911));
full_adder full_adder11_20(.a(data_A[20] & data_B[11]),.b(w10_2110), .cin(wc11_1911), .s(w11_2011), .cout(wc11_2011));
full_adder full_adder11_21(.a(data_A[21] & data_B[11]),.b(w10_2210), .cin(wc11_2011), .s(w11_2111), .cout(wc11_2111));
full_adder full_adder11_22(.a(data_A[22] & data_B[11]),.b(w10_2310), .cin(wc11_2111), .s(w11_2211), .cout(wc11_2211));
full_adder full_adder11_23(.a(data_A[23] & data_B[11]),.b(w10_2410), .cin(wc11_2211), .s(w11_2311), .cout(wc11_2311));
full_adder full_adder11_24(.a(data_A[24] & data_B[11]),.b(w10_2510), .cin(wc11_2311), .s(w11_2411), .cout(wc11_2411));
full_adder full_adder11_25(.a(data_A[25] & data_B[11]),.b(w10_2610), .cin(wc11_2411), .s(w11_2511), .cout(wc11_2511));
full_adder full_adder11_26(.a(data_A[26] & data_B[11]),.b(w10_2710), .cin(wc11_2511), .s(w11_2611), .cout(wc11_2611));
full_adder full_adder11_27(.a(data_A[27] & data_B[11]),.b(w10_2810), .cin(wc11_2611), .s(w11_2711), .cout(wc11_2711));
full_adder full_adder11_28(.a(data_A[28] & data_B[11]),.b(w10_2910), .cin(wc11_2711), .s(w11_2811), .cout(wc11_2811));
full_adder full_adder11_29(.a(data_A[29] & data_B[11]),.b(w10_3010), .cin(wc11_2811), .s(w11_2911), .cout(wc11_2911));
full_adder full_adder11_30(.a(data_A[30] & data_B[11]),.b(w10_3110), .cin(wc11_2911), .s(w11_3011), .cout(wc11_3011));
full_adder full_adder11_31(.a(~(data_A[31] & data_B[11])),.b(wc10_3110), .cin(wc11_3011), .s(w11_3111), .cout(wc11_3111));
assign mult_out[11] = w11_011;
half_adder half_adder12_0(.a(data_A[0] & data_B[12]), .b(w11_111), .s(w12_012), .cout(wc12_012));
full_adder full_adder12_1(.a(data_A[1] & data_B[12]),.b(w11_211), .cin(wc12_012), .s(w12_112), .cout(wc12_112));
full_adder full_adder12_2(.a(data_A[2] & data_B[12]),.b(w11_311), .cin(wc12_112), .s(w12_212), .cout(wc12_212));
full_adder full_adder12_3(.a(data_A[3] & data_B[12]),.b(w11_411), .cin(wc12_212), .s(w12_312), .cout(wc12_312));
full_adder full_adder12_4(.a(data_A[4] & data_B[12]),.b(w11_511), .cin(wc12_312), .s(w12_412), .cout(wc12_412));
full_adder full_adder12_5(.a(data_A[5] & data_B[12]),.b(w11_611), .cin(wc12_412), .s(w12_512), .cout(wc12_512));
full_adder full_adder12_6(.a(data_A[6] & data_B[12]),.b(w11_711), .cin(wc12_512), .s(w12_612), .cout(wc12_612));
full_adder full_adder12_7(.a(data_A[7] & data_B[12]),.b(w11_811), .cin(wc12_612), .s(w12_712), .cout(wc12_712));
full_adder full_adder12_8(.a(data_A[8] & data_B[12]),.b(w11_911), .cin(wc12_712), .s(w12_812), .cout(wc12_812));
full_adder full_adder12_9(.a(data_A[9] & data_B[12]),.b(w11_1011), .cin(wc12_812), .s(w12_912), .cout(wc12_912));
full_adder full_adder12_10(.a(data_A[10] & data_B[12]),.b(w11_1111), .cin(wc12_912), .s(w12_1012), .cout(wc12_1012));
full_adder full_adder12_11(.a(data_A[11] & data_B[12]),.b(w11_1211), .cin(wc12_1012), .s(w12_1112), .cout(wc12_1112));
full_adder full_adder12_12(.a(data_A[12] & data_B[12]),.b(w11_1311), .cin(wc12_1112), .s(w12_1212), .cout(wc12_1212));
full_adder full_adder12_13(.a(data_A[13] & data_B[12]),.b(w11_1411), .cin(wc12_1212), .s(w12_1312), .cout(wc12_1312));
full_adder full_adder12_14(.a(data_A[14] & data_B[12]),.b(w11_1511), .cin(wc12_1312), .s(w12_1412), .cout(wc12_1412));
full_adder full_adder12_15(.a(data_A[15] & data_B[12]),.b(w11_1611), .cin(wc12_1412), .s(w12_1512), .cout(wc12_1512));
full_adder full_adder12_16(.a(data_A[16] & data_B[12]),.b(w11_1711), .cin(wc12_1512), .s(w12_1612), .cout(wc12_1612));
full_adder full_adder12_17(.a(data_A[17] & data_B[12]),.b(w11_1811), .cin(wc12_1612), .s(w12_1712), .cout(wc12_1712));
full_adder full_adder12_18(.a(data_A[18] & data_B[12]),.b(w11_1911), .cin(wc12_1712), .s(w12_1812), .cout(wc12_1812));
full_adder full_adder12_19(.a(data_A[19] & data_B[12]),.b(w11_2011), .cin(wc12_1812), .s(w12_1912), .cout(wc12_1912));
full_adder full_adder12_20(.a(data_A[20] & data_B[12]),.b(w11_2111), .cin(wc12_1912), .s(w12_2012), .cout(wc12_2012));
full_adder full_adder12_21(.a(data_A[21] & data_B[12]),.b(w11_2211), .cin(wc12_2012), .s(w12_2112), .cout(wc12_2112));
full_adder full_adder12_22(.a(data_A[22] & data_B[12]),.b(w11_2311), .cin(wc12_2112), .s(w12_2212), .cout(wc12_2212));
full_adder full_adder12_23(.a(data_A[23] & data_B[12]),.b(w11_2411), .cin(wc12_2212), .s(w12_2312), .cout(wc12_2312));
full_adder full_adder12_24(.a(data_A[24] & data_B[12]),.b(w11_2511), .cin(wc12_2312), .s(w12_2412), .cout(wc12_2412));
full_adder full_adder12_25(.a(data_A[25] & data_B[12]),.b(w11_2611), .cin(wc12_2412), .s(w12_2512), .cout(wc12_2512));
full_adder full_adder12_26(.a(data_A[26] & data_B[12]),.b(w11_2711), .cin(wc12_2512), .s(w12_2612), .cout(wc12_2612));
full_adder full_adder12_27(.a(data_A[27] & data_B[12]),.b(w11_2811), .cin(wc12_2612), .s(w12_2712), .cout(wc12_2712));
full_adder full_adder12_28(.a(data_A[28] & data_B[12]),.b(w11_2911), .cin(wc12_2712), .s(w12_2812), .cout(wc12_2812));
full_adder full_adder12_29(.a(data_A[29] & data_B[12]),.b(w11_3011), .cin(wc12_2812), .s(w12_2912), .cout(wc12_2912));
full_adder full_adder12_30(.a(data_A[30] & data_B[12]),.b(w11_3111), .cin(wc12_2912), .s(w12_3012), .cout(wc12_3012));
full_adder full_adder12_31(.a(~(data_A[31] & data_B[12])),.b(wc11_3111), .cin(wc12_3012), .s(w12_3112), .cout(wc12_3112));
assign mult_out[12] = w12_012;
half_adder half_adder13_0(.a(data_A[0] & data_B[13]), .b(w12_112), .s(w13_013), .cout(wc13_013));
full_adder full_adder13_1(.a(data_A[1] & data_B[13]),.b(w12_212), .cin(wc13_013), .s(w13_113), .cout(wc13_113));
full_adder full_adder13_2(.a(data_A[2] & data_B[13]),.b(w12_312), .cin(wc13_113), .s(w13_213), .cout(wc13_213));
full_adder full_adder13_3(.a(data_A[3] & data_B[13]),.b(w12_412), .cin(wc13_213), .s(w13_313), .cout(wc13_313));
full_adder full_adder13_4(.a(data_A[4] & data_B[13]),.b(w12_512), .cin(wc13_313), .s(w13_413), .cout(wc13_413));
full_adder full_adder13_5(.a(data_A[5] & data_B[13]),.b(w12_612), .cin(wc13_413), .s(w13_513), .cout(wc13_513));
full_adder full_adder13_6(.a(data_A[6] & data_B[13]),.b(w12_712), .cin(wc13_513), .s(w13_613), .cout(wc13_613));
full_adder full_adder13_7(.a(data_A[7] & data_B[13]),.b(w12_812), .cin(wc13_613), .s(w13_713), .cout(wc13_713));
full_adder full_adder13_8(.a(data_A[8] & data_B[13]),.b(w12_912), .cin(wc13_713), .s(w13_813), .cout(wc13_813));
full_adder full_adder13_9(.a(data_A[9] & data_B[13]),.b(w12_1012), .cin(wc13_813), .s(w13_913), .cout(wc13_913));
full_adder full_adder13_10(.a(data_A[10] & data_B[13]),.b(w12_1112), .cin(wc13_913), .s(w13_1013), .cout(wc13_1013));
full_adder full_adder13_11(.a(data_A[11] & data_B[13]),.b(w12_1212), .cin(wc13_1013), .s(w13_1113), .cout(wc13_1113));
full_adder full_adder13_12(.a(data_A[12] & data_B[13]),.b(w12_1312), .cin(wc13_1113), .s(w13_1213), .cout(wc13_1213));
full_adder full_adder13_13(.a(data_A[13] & data_B[13]),.b(w12_1412), .cin(wc13_1213), .s(w13_1313), .cout(wc13_1313));
full_adder full_adder13_14(.a(data_A[14] & data_B[13]),.b(w12_1512), .cin(wc13_1313), .s(w13_1413), .cout(wc13_1413));
full_adder full_adder13_15(.a(data_A[15] & data_B[13]),.b(w12_1612), .cin(wc13_1413), .s(w13_1513), .cout(wc13_1513));
full_adder full_adder13_16(.a(data_A[16] & data_B[13]),.b(w12_1712), .cin(wc13_1513), .s(w13_1613), .cout(wc13_1613));
full_adder full_adder13_17(.a(data_A[17] & data_B[13]),.b(w12_1812), .cin(wc13_1613), .s(w13_1713), .cout(wc13_1713));
full_adder full_adder13_18(.a(data_A[18] & data_B[13]),.b(w12_1912), .cin(wc13_1713), .s(w13_1813), .cout(wc13_1813));
full_adder full_adder13_19(.a(data_A[19] & data_B[13]),.b(w12_2012), .cin(wc13_1813), .s(w13_1913), .cout(wc13_1913));
full_adder full_adder13_20(.a(data_A[20] & data_B[13]),.b(w12_2112), .cin(wc13_1913), .s(w13_2013), .cout(wc13_2013));
full_adder full_adder13_21(.a(data_A[21] & data_B[13]),.b(w12_2212), .cin(wc13_2013), .s(w13_2113), .cout(wc13_2113));
full_adder full_adder13_22(.a(data_A[22] & data_B[13]),.b(w12_2312), .cin(wc13_2113), .s(w13_2213), .cout(wc13_2213));
full_adder full_adder13_23(.a(data_A[23] & data_B[13]),.b(w12_2412), .cin(wc13_2213), .s(w13_2313), .cout(wc13_2313));
full_adder full_adder13_24(.a(data_A[24] & data_B[13]),.b(w12_2512), .cin(wc13_2313), .s(w13_2413), .cout(wc13_2413));
full_adder full_adder13_25(.a(data_A[25] & data_B[13]),.b(w12_2612), .cin(wc13_2413), .s(w13_2513), .cout(wc13_2513));
full_adder full_adder13_26(.a(data_A[26] & data_B[13]),.b(w12_2712), .cin(wc13_2513), .s(w13_2613), .cout(wc13_2613));
full_adder full_adder13_27(.a(data_A[27] & data_B[13]),.b(w12_2812), .cin(wc13_2613), .s(w13_2713), .cout(wc13_2713));
full_adder full_adder13_28(.a(data_A[28] & data_B[13]),.b(w12_2912), .cin(wc13_2713), .s(w13_2813), .cout(wc13_2813));
full_adder full_adder13_29(.a(data_A[29] & data_B[13]),.b(w12_3012), .cin(wc13_2813), .s(w13_2913), .cout(wc13_2913));
full_adder full_adder13_30(.a(data_A[30] & data_B[13]),.b(w12_3112), .cin(wc13_2913), .s(w13_3013), .cout(wc13_3013));
full_adder full_adder13_31(.a(~(data_A[31] & data_B[13])),.b(wc12_3112), .cin(wc13_3013), .s(w13_3113), .cout(wc13_3113));
assign mult_out[13] = w13_013;
half_adder half_adder14_0(.a(data_A[0] & data_B[14]), .b(w13_113), .s(w14_014), .cout(wc14_014));
full_adder full_adder14_1(.a(data_A[1] & data_B[14]),.b(w13_213), .cin(wc14_014), .s(w14_114), .cout(wc14_114));
full_adder full_adder14_2(.a(data_A[2] & data_B[14]),.b(w13_313), .cin(wc14_114), .s(w14_214), .cout(wc14_214));
full_adder full_adder14_3(.a(data_A[3] & data_B[14]),.b(w13_413), .cin(wc14_214), .s(w14_314), .cout(wc14_314));
full_adder full_adder14_4(.a(data_A[4] & data_B[14]),.b(w13_513), .cin(wc14_314), .s(w14_414), .cout(wc14_414));
full_adder full_adder14_5(.a(data_A[5] & data_B[14]),.b(w13_613), .cin(wc14_414), .s(w14_514), .cout(wc14_514));
full_adder full_adder14_6(.a(data_A[6] & data_B[14]),.b(w13_713), .cin(wc14_514), .s(w14_614), .cout(wc14_614));
full_adder full_adder14_7(.a(data_A[7] & data_B[14]),.b(w13_813), .cin(wc14_614), .s(w14_714), .cout(wc14_714));
full_adder full_adder14_8(.a(data_A[8] & data_B[14]),.b(w13_913), .cin(wc14_714), .s(w14_814), .cout(wc14_814));
full_adder full_adder14_9(.a(data_A[9] & data_B[14]),.b(w13_1013), .cin(wc14_814), .s(w14_914), .cout(wc14_914));
full_adder full_adder14_10(.a(data_A[10] & data_B[14]),.b(w13_1113), .cin(wc14_914), .s(w14_1014), .cout(wc14_1014));
full_adder full_adder14_11(.a(data_A[11] & data_B[14]),.b(w13_1213), .cin(wc14_1014), .s(w14_1114), .cout(wc14_1114));
full_adder full_adder14_12(.a(data_A[12] & data_B[14]),.b(w13_1313), .cin(wc14_1114), .s(w14_1214), .cout(wc14_1214));
full_adder full_adder14_13(.a(data_A[13] & data_B[14]),.b(w13_1413), .cin(wc14_1214), .s(w14_1314), .cout(wc14_1314));
full_adder full_adder14_14(.a(data_A[14] & data_B[14]),.b(w13_1513), .cin(wc14_1314), .s(w14_1414), .cout(wc14_1414));
full_adder full_adder14_15(.a(data_A[15] & data_B[14]),.b(w13_1613), .cin(wc14_1414), .s(w14_1514), .cout(wc14_1514));
full_adder full_adder14_16(.a(data_A[16] & data_B[14]),.b(w13_1713), .cin(wc14_1514), .s(w14_1614), .cout(wc14_1614));
full_adder full_adder14_17(.a(data_A[17] & data_B[14]),.b(w13_1813), .cin(wc14_1614), .s(w14_1714), .cout(wc14_1714));
full_adder full_adder14_18(.a(data_A[18] & data_B[14]),.b(w13_1913), .cin(wc14_1714), .s(w14_1814), .cout(wc14_1814));
full_adder full_adder14_19(.a(data_A[19] & data_B[14]),.b(w13_2013), .cin(wc14_1814), .s(w14_1914), .cout(wc14_1914));
full_adder full_adder14_20(.a(data_A[20] & data_B[14]),.b(w13_2113), .cin(wc14_1914), .s(w14_2014), .cout(wc14_2014));
full_adder full_adder14_21(.a(data_A[21] & data_B[14]),.b(w13_2213), .cin(wc14_2014), .s(w14_2114), .cout(wc14_2114));
full_adder full_adder14_22(.a(data_A[22] & data_B[14]),.b(w13_2313), .cin(wc14_2114), .s(w14_2214), .cout(wc14_2214));
full_adder full_adder14_23(.a(data_A[23] & data_B[14]),.b(w13_2413), .cin(wc14_2214), .s(w14_2314), .cout(wc14_2314));
full_adder full_adder14_24(.a(data_A[24] & data_B[14]),.b(w13_2513), .cin(wc14_2314), .s(w14_2414), .cout(wc14_2414));
full_adder full_adder14_25(.a(data_A[25] & data_B[14]),.b(w13_2613), .cin(wc14_2414), .s(w14_2514), .cout(wc14_2514));
full_adder full_adder14_26(.a(data_A[26] & data_B[14]),.b(w13_2713), .cin(wc14_2514), .s(w14_2614), .cout(wc14_2614));
full_adder full_adder14_27(.a(data_A[27] & data_B[14]),.b(w13_2813), .cin(wc14_2614), .s(w14_2714), .cout(wc14_2714));
full_adder full_adder14_28(.a(data_A[28] & data_B[14]),.b(w13_2913), .cin(wc14_2714), .s(w14_2814), .cout(wc14_2814));
full_adder full_adder14_29(.a(data_A[29] & data_B[14]),.b(w13_3013), .cin(wc14_2814), .s(w14_2914), .cout(wc14_2914));
full_adder full_adder14_30(.a(data_A[30] & data_B[14]),.b(w13_3113), .cin(wc14_2914), .s(w14_3014), .cout(wc14_3014));
full_adder full_adder14_31(.a(~(data_A[31] & data_B[14])),.b(wc13_3113), .cin(wc14_3014), .s(w14_3114), .cout(wc14_3114));
assign mult_out[14] = w14_014;
half_adder half_adder15_0(.a(data_A[0] & data_B[15]), .b(w14_114), .s(w15_015), .cout(wc15_015));
full_adder full_adder15_1(.a(data_A[1] & data_B[15]),.b(w14_214), .cin(wc15_015), .s(w15_115), .cout(wc15_115));
full_adder full_adder15_2(.a(data_A[2] & data_B[15]),.b(w14_314), .cin(wc15_115), .s(w15_215), .cout(wc15_215));
full_adder full_adder15_3(.a(data_A[3] & data_B[15]),.b(w14_414), .cin(wc15_215), .s(w15_315), .cout(wc15_315));
full_adder full_adder15_4(.a(data_A[4] & data_B[15]),.b(w14_514), .cin(wc15_315), .s(w15_415), .cout(wc15_415));
full_adder full_adder15_5(.a(data_A[5] & data_B[15]),.b(w14_614), .cin(wc15_415), .s(w15_515), .cout(wc15_515));
full_adder full_adder15_6(.a(data_A[6] & data_B[15]),.b(w14_714), .cin(wc15_515), .s(w15_615), .cout(wc15_615));
full_adder full_adder15_7(.a(data_A[7] & data_B[15]),.b(w14_814), .cin(wc15_615), .s(w15_715), .cout(wc15_715));
full_adder full_adder15_8(.a(data_A[8] & data_B[15]),.b(w14_914), .cin(wc15_715), .s(w15_815), .cout(wc15_815));
full_adder full_adder15_9(.a(data_A[9] & data_B[15]),.b(w14_1014), .cin(wc15_815), .s(w15_915), .cout(wc15_915));
full_adder full_adder15_10(.a(data_A[10] & data_B[15]),.b(w14_1114), .cin(wc15_915), .s(w15_1015), .cout(wc15_1015));
full_adder full_adder15_11(.a(data_A[11] & data_B[15]),.b(w14_1214), .cin(wc15_1015), .s(w15_1115), .cout(wc15_1115));
full_adder full_adder15_12(.a(data_A[12] & data_B[15]),.b(w14_1314), .cin(wc15_1115), .s(w15_1215), .cout(wc15_1215));
full_adder full_adder15_13(.a(data_A[13] & data_B[15]),.b(w14_1414), .cin(wc15_1215), .s(w15_1315), .cout(wc15_1315));
full_adder full_adder15_14(.a(data_A[14] & data_B[15]),.b(w14_1514), .cin(wc15_1315), .s(w15_1415), .cout(wc15_1415));
full_adder full_adder15_15(.a(data_A[15] & data_B[15]),.b(w14_1614), .cin(wc15_1415), .s(w15_1515), .cout(wc15_1515));
full_adder full_adder15_16(.a(data_A[16] & data_B[15]),.b(w14_1714), .cin(wc15_1515), .s(w15_1615), .cout(wc15_1615));
full_adder full_adder15_17(.a(data_A[17] & data_B[15]),.b(w14_1814), .cin(wc15_1615), .s(w15_1715), .cout(wc15_1715));
full_adder full_adder15_18(.a(data_A[18] & data_B[15]),.b(w14_1914), .cin(wc15_1715), .s(w15_1815), .cout(wc15_1815));
full_adder full_adder15_19(.a(data_A[19] & data_B[15]),.b(w14_2014), .cin(wc15_1815), .s(w15_1915), .cout(wc15_1915));
full_adder full_adder15_20(.a(data_A[20] & data_B[15]),.b(w14_2114), .cin(wc15_1915), .s(w15_2015), .cout(wc15_2015));
full_adder full_adder15_21(.a(data_A[21] & data_B[15]),.b(w14_2214), .cin(wc15_2015), .s(w15_2115), .cout(wc15_2115));
full_adder full_adder15_22(.a(data_A[22] & data_B[15]),.b(w14_2314), .cin(wc15_2115), .s(w15_2215), .cout(wc15_2215));
full_adder full_adder15_23(.a(data_A[23] & data_B[15]),.b(w14_2414), .cin(wc15_2215), .s(w15_2315), .cout(wc15_2315));
full_adder full_adder15_24(.a(data_A[24] & data_B[15]),.b(w14_2514), .cin(wc15_2315), .s(w15_2415), .cout(wc15_2415));
full_adder full_adder15_25(.a(data_A[25] & data_B[15]),.b(w14_2614), .cin(wc15_2415), .s(w15_2515), .cout(wc15_2515));
full_adder full_adder15_26(.a(data_A[26] & data_B[15]),.b(w14_2714), .cin(wc15_2515), .s(w15_2615), .cout(wc15_2615));
full_adder full_adder15_27(.a(data_A[27] & data_B[15]),.b(w14_2814), .cin(wc15_2615), .s(w15_2715), .cout(wc15_2715));
full_adder full_adder15_28(.a(data_A[28] & data_B[15]),.b(w14_2914), .cin(wc15_2715), .s(w15_2815), .cout(wc15_2815));
full_adder full_adder15_29(.a(data_A[29] & data_B[15]),.b(w14_3014), .cin(wc15_2815), .s(w15_2915), .cout(wc15_2915));
full_adder full_adder15_30(.a(data_A[30] & data_B[15]),.b(w14_3114), .cin(wc15_2915), .s(w15_3015), .cout(wc15_3015));
full_adder full_adder15_31(.a(~(data_A[31] & data_B[15])),.b(wc14_3114), .cin(wc15_3015), .s(w15_3115), .cout(wc15_3115));
assign mult_out[15] = w15_015;
half_adder half_adder16_0(.a(data_A[0] & data_B[16]), .b(w15_115), .s(w16_016), .cout(wc16_016));
full_adder full_adder16_1(.a(data_A[1] & data_B[16]),.b(w15_215), .cin(wc16_016), .s(w16_116), .cout(wc16_116));
full_adder full_adder16_2(.a(data_A[2] & data_B[16]),.b(w15_315), .cin(wc16_116), .s(w16_216), .cout(wc16_216));
full_adder full_adder16_3(.a(data_A[3] & data_B[16]),.b(w15_415), .cin(wc16_216), .s(w16_316), .cout(wc16_316));
full_adder full_adder16_4(.a(data_A[4] & data_B[16]),.b(w15_515), .cin(wc16_316), .s(w16_416), .cout(wc16_416));
full_adder full_adder16_5(.a(data_A[5] & data_B[16]),.b(w15_615), .cin(wc16_416), .s(w16_516), .cout(wc16_516));
full_adder full_adder16_6(.a(data_A[6] & data_B[16]),.b(w15_715), .cin(wc16_516), .s(w16_616), .cout(wc16_616));
full_adder full_adder16_7(.a(data_A[7] & data_B[16]),.b(w15_815), .cin(wc16_616), .s(w16_716), .cout(wc16_716));
full_adder full_adder16_8(.a(data_A[8] & data_B[16]),.b(w15_915), .cin(wc16_716), .s(w16_816), .cout(wc16_816));
full_adder full_adder16_9(.a(data_A[9] & data_B[16]),.b(w15_1015), .cin(wc16_816), .s(w16_916), .cout(wc16_916));
full_adder full_adder16_10(.a(data_A[10] & data_B[16]),.b(w15_1115), .cin(wc16_916), .s(w16_1016), .cout(wc16_1016));
full_adder full_adder16_11(.a(data_A[11] & data_B[16]),.b(w15_1215), .cin(wc16_1016), .s(w16_1116), .cout(wc16_1116));
full_adder full_adder16_12(.a(data_A[12] & data_B[16]),.b(w15_1315), .cin(wc16_1116), .s(w16_1216), .cout(wc16_1216));
full_adder full_adder16_13(.a(data_A[13] & data_B[16]),.b(w15_1415), .cin(wc16_1216), .s(w16_1316), .cout(wc16_1316));
full_adder full_adder16_14(.a(data_A[14] & data_B[16]),.b(w15_1515), .cin(wc16_1316), .s(w16_1416), .cout(wc16_1416));
full_adder full_adder16_15(.a(data_A[15] & data_B[16]),.b(w15_1615), .cin(wc16_1416), .s(w16_1516), .cout(wc16_1516));
full_adder full_adder16_16(.a(data_A[16] & data_B[16]),.b(w15_1715), .cin(wc16_1516), .s(w16_1616), .cout(wc16_1616));
full_adder full_adder16_17(.a(data_A[17] & data_B[16]),.b(w15_1815), .cin(wc16_1616), .s(w16_1716), .cout(wc16_1716));
full_adder full_adder16_18(.a(data_A[18] & data_B[16]),.b(w15_1915), .cin(wc16_1716), .s(w16_1816), .cout(wc16_1816));
full_adder full_adder16_19(.a(data_A[19] & data_B[16]),.b(w15_2015), .cin(wc16_1816), .s(w16_1916), .cout(wc16_1916));
full_adder full_adder16_20(.a(data_A[20] & data_B[16]),.b(w15_2115), .cin(wc16_1916), .s(w16_2016), .cout(wc16_2016));
full_adder full_adder16_21(.a(data_A[21] & data_B[16]),.b(w15_2215), .cin(wc16_2016), .s(w16_2116), .cout(wc16_2116));
full_adder full_adder16_22(.a(data_A[22] & data_B[16]),.b(w15_2315), .cin(wc16_2116), .s(w16_2216), .cout(wc16_2216));
full_adder full_adder16_23(.a(data_A[23] & data_B[16]),.b(w15_2415), .cin(wc16_2216), .s(w16_2316), .cout(wc16_2316));
full_adder full_adder16_24(.a(data_A[24] & data_B[16]),.b(w15_2515), .cin(wc16_2316), .s(w16_2416), .cout(wc16_2416));
full_adder full_adder16_25(.a(data_A[25] & data_B[16]),.b(w15_2615), .cin(wc16_2416), .s(w16_2516), .cout(wc16_2516));
full_adder full_adder16_26(.a(data_A[26] & data_B[16]),.b(w15_2715), .cin(wc16_2516), .s(w16_2616), .cout(wc16_2616));
full_adder full_adder16_27(.a(data_A[27] & data_B[16]),.b(w15_2815), .cin(wc16_2616), .s(w16_2716), .cout(wc16_2716));
full_adder full_adder16_28(.a(data_A[28] & data_B[16]),.b(w15_2915), .cin(wc16_2716), .s(w16_2816), .cout(wc16_2816));
full_adder full_adder16_29(.a(data_A[29] & data_B[16]),.b(w15_3015), .cin(wc16_2816), .s(w16_2916), .cout(wc16_2916));
full_adder full_adder16_30(.a(data_A[30] & data_B[16]),.b(w15_3115), .cin(wc16_2916), .s(w16_3016), .cout(wc16_3016));
full_adder full_adder16_31(.a(~(data_A[31] & data_B[16])),.b(wc15_3115), .cin(wc16_3016), .s(w16_3116), .cout(wc16_3116));
assign mult_out[16] = w16_016;
half_adder half_adder17_0(.a(data_A[0] & data_B[17]), .b(w16_116), .s(w17_017), .cout(wc17_017));
full_adder full_adder17_1(.a(data_A[1] & data_B[17]),.b(w16_216), .cin(wc17_017), .s(w17_117), .cout(wc17_117));
full_adder full_adder17_2(.a(data_A[2] & data_B[17]),.b(w16_316), .cin(wc17_117), .s(w17_217), .cout(wc17_217));
full_adder full_adder17_3(.a(data_A[3] & data_B[17]),.b(w16_416), .cin(wc17_217), .s(w17_317), .cout(wc17_317));
full_adder full_adder17_4(.a(data_A[4] & data_B[17]),.b(w16_516), .cin(wc17_317), .s(w17_417), .cout(wc17_417));
full_adder full_adder17_5(.a(data_A[5] & data_B[17]),.b(w16_616), .cin(wc17_417), .s(w17_517), .cout(wc17_517));
full_adder full_adder17_6(.a(data_A[6] & data_B[17]),.b(w16_716), .cin(wc17_517), .s(w17_617), .cout(wc17_617));
full_adder full_adder17_7(.a(data_A[7] & data_B[17]),.b(w16_816), .cin(wc17_617), .s(w17_717), .cout(wc17_717));
full_adder full_adder17_8(.a(data_A[8] & data_B[17]),.b(w16_916), .cin(wc17_717), .s(w17_817), .cout(wc17_817));
full_adder full_adder17_9(.a(data_A[9] & data_B[17]),.b(w16_1016), .cin(wc17_817), .s(w17_917), .cout(wc17_917));
full_adder full_adder17_10(.a(data_A[10] & data_B[17]),.b(w16_1116), .cin(wc17_917), .s(w17_1017), .cout(wc17_1017));
full_adder full_adder17_11(.a(data_A[11] & data_B[17]),.b(w16_1216), .cin(wc17_1017), .s(w17_1117), .cout(wc17_1117));
full_adder full_adder17_12(.a(data_A[12] & data_B[17]),.b(w16_1316), .cin(wc17_1117), .s(w17_1217), .cout(wc17_1217));
full_adder full_adder17_13(.a(data_A[13] & data_B[17]),.b(w16_1416), .cin(wc17_1217), .s(w17_1317), .cout(wc17_1317));
full_adder full_adder17_14(.a(data_A[14] & data_B[17]),.b(w16_1516), .cin(wc17_1317), .s(w17_1417), .cout(wc17_1417));
full_adder full_adder17_15(.a(data_A[15] & data_B[17]),.b(w16_1616), .cin(wc17_1417), .s(w17_1517), .cout(wc17_1517));
full_adder full_adder17_16(.a(data_A[16] & data_B[17]),.b(w16_1716), .cin(wc17_1517), .s(w17_1617), .cout(wc17_1617));
full_adder full_adder17_17(.a(data_A[17] & data_B[17]),.b(w16_1816), .cin(wc17_1617), .s(w17_1717), .cout(wc17_1717));
full_adder full_adder17_18(.a(data_A[18] & data_B[17]),.b(w16_1916), .cin(wc17_1717), .s(w17_1817), .cout(wc17_1817));
full_adder full_adder17_19(.a(data_A[19] & data_B[17]),.b(w16_2016), .cin(wc17_1817), .s(w17_1917), .cout(wc17_1917));
full_adder full_adder17_20(.a(data_A[20] & data_B[17]),.b(w16_2116), .cin(wc17_1917), .s(w17_2017), .cout(wc17_2017));
full_adder full_adder17_21(.a(data_A[21] & data_B[17]),.b(w16_2216), .cin(wc17_2017), .s(w17_2117), .cout(wc17_2117));
full_adder full_adder17_22(.a(data_A[22] & data_B[17]),.b(w16_2316), .cin(wc17_2117), .s(w17_2217), .cout(wc17_2217));
full_adder full_adder17_23(.a(data_A[23] & data_B[17]),.b(w16_2416), .cin(wc17_2217), .s(w17_2317), .cout(wc17_2317));
full_adder full_adder17_24(.a(data_A[24] & data_B[17]),.b(w16_2516), .cin(wc17_2317), .s(w17_2417), .cout(wc17_2417));
full_adder full_adder17_25(.a(data_A[25] & data_B[17]),.b(w16_2616), .cin(wc17_2417), .s(w17_2517), .cout(wc17_2517));
full_adder full_adder17_26(.a(data_A[26] & data_B[17]),.b(w16_2716), .cin(wc17_2517), .s(w17_2617), .cout(wc17_2617));
full_adder full_adder17_27(.a(data_A[27] & data_B[17]),.b(w16_2816), .cin(wc17_2617), .s(w17_2717), .cout(wc17_2717));
full_adder full_adder17_28(.a(data_A[28] & data_B[17]),.b(w16_2916), .cin(wc17_2717), .s(w17_2817), .cout(wc17_2817));
full_adder full_adder17_29(.a(data_A[29] & data_B[17]),.b(w16_3016), .cin(wc17_2817), .s(w17_2917), .cout(wc17_2917));
full_adder full_adder17_30(.a(data_A[30] & data_B[17]),.b(w16_3116), .cin(wc17_2917), .s(w17_3017), .cout(wc17_3017));
full_adder full_adder17_31(.a(~(data_A[31] & data_B[17])),.b(wc16_3116), .cin(wc17_3017), .s(w17_3117), .cout(wc17_3117));
assign mult_out[17] = w17_017;
half_adder half_adder18_0(.a(data_A[0] & data_B[18]), .b(w17_117), .s(w18_018), .cout(wc18_018));
full_adder full_adder18_1(.a(data_A[1] & data_B[18]),.b(w17_217), .cin(wc18_018), .s(w18_118), .cout(wc18_118));
full_adder full_adder18_2(.a(data_A[2] & data_B[18]),.b(w17_317), .cin(wc18_118), .s(w18_218), .cout(wc18_218));
full_adder full_adder18_3(.a(data_A[3] & data_B[18]),.b(w17_417), .cin(wc18_218), .s(w18_318), .cout(wc18_318));
full_adder full_adder18_4(.a(data_A[4] & data_B[18]),.b(w17_517), .cin(wc18_318), .s(w18_418), .cout(wc18_418));
full_adder full_adder18_5(.a(data_A[5] & data_B[18]),.b(w17_617), .cin(wc18_418), .s(w18_518), .cout(wc18_518));
full_adder full_adder18_6(.a(data_A[6] & data_B[18]),.b(w17_717), .cin(wc18_518), .s(w18_618), .cout(wc18_618));
full_adder full_adder18_7(.a(data_A[7] & data_B[18]),.b(w17_817), .cin(wc18_618), .s(w18_718), .cout(wc18_718));
full_adder full_adder18_8(.a(data_A[8] & data_B[18]),.b(w17_917), .cin(wc18_718), .s(w18_818), .cout(wc18_818));
full_adder full_adder18_9(.a(data_A[9] & data_B[18]),.b(w17_1017), .cin(wc18_818), .s(w18_918), .cout(wc18_918));
full_adder full_adder18_10(.a(data_A[10] & data_B[18]),.b(w17_1117), .cin(wc18_918), .s(w18_1018), .cout(wc18_1018));
full_adder full_adder18_11(.a(data_A[11] & data_B[18]),.b(w17_1217), .cin(wc18_1018), .s(w18_1118), .cout(wc18_1118));
full_adder full_adder18_12(.a(data_A[12] & data_B[18]),.b(w17_1317), .cin(wc18_1118), .s(w18_1218), .cout(wc18_1218));
full_adder full_adder18_13(.a(data_A[13] & data_B[18]),.b(w17_1417), .cin(wc18_1218), .s(w18_1318), .cout(wc18_1318));
full_adder full_adder18_14(.a(data_A[14] & data_B[18]),.b(w17_1517), .cin(wc18_1318), .s(w18_1418), .cout(wc18_1418));
full_adder full_adder18_15(.a(data_A[15] & data_B[18]),.b(w17_1617), .cin(wc18_1418), .s(w18_1518), .cout(wc18_1518));
full_adder full_adder18_16(.a(data_A[16] & data_B[18]),.b(w17_1717), .cin(wc18_1518), .s(w18_1618), .cout(wc18_1618));
full_adder full_adder18_17(.a(data_A[17] & data_B[18]),.b(w17_1817), .cin(wc18_1618), .s(w18_1718), .cout(wc18_1718));
full_adder full_adder18_18(.a(data_A[18] & data_B[18]),.b(w17_1917), .cin(wc18_1718), .s(w18_1818), .cout(wc18_1818));
full_adder full_adder18_19(.a(data_A[19] & data_B[18]),.b(w17_2017), .cin(wc18_1818), .s(w18_1918), .cout(wc18_1918));
full_adder full_adder18_20(.a(data_A[20] & data_B[18]),.b(w17_2117), .cin(wc18_1918), .s(w18_2018), .cout(wc18_2018));
full_adder full_adder18_21(.a(data_A[21] & data_B[18]),.b(w17_2217), .cin(wc18_2018), .s(w18_2118), .cout(wc18_2118));
full_adder full_adder18_22(.a(data_A[22] & data_B[18]),.b(w17_2317), .cin(wc18_2118), .s(w18_2218), .cout(wc18_2218));
full_adder full_adder18_23(.a(data_A[23] & data_B[18]),.b(w17_2417), .cin(wc18_2218), .s(w18_2318), .cout(wc18_2318));
full_adder full_adder18_24(.a(data_A[24] & data_B[18]),.b(w17_2517), .cin(wc18_2318), .s(w18_2418), .cout(wc18_2418));
full_adder full_adder18_25(.a(data_A[25] & data_B[18]),.b(w17_2617), .cin(wc18_2418), .s(w18_2518), .cout(wc18_2518));
full_adder full_adder18_26(.a(data_A[26] & data_B[18]),.b(w17_2717), .cin(wc18_2518), .s(w18_2618), .cout(wc18_2618));
full_adder full_adder18_27(.a(data_A[27] & data_B[18]),.b(w17_2817), .cin(wc18_2618), .s(w18_2718), .cout(wc18_2718));
full_adder full_adder18_28(.a(data_A[28] & data_B[18]),.b(w17_2917), .cin(wc18_2718), .s(w18_2818), .cout(wc18_2818));
full_adder full_adder18_29(.a(data_A[29] & data_B[18]),.b(w17_3017), .cin(wc18_2818), .s(w18_2918), .cout(wc18_2918));
full_adder full_adder18_30(.a(data_A[30] & data_B[18]),.b(w17_3117), .cin(wc18_2918), .s(w18_3018), .cout(wc18_3018));
full_adder full_adder18_31(.a(~(data_A[31] & data_B[18])),.b(wc17_3117), .cin(wc18_3018), .s(w18_3118), .cout(wc18_3118));
assign mult_out[18] = w18_018;
half_adder half_adder19_0(.a(data_A[0] & data_B[19]), .b(w18_118), .s(w19_019), .cout(wc19_019));
full_adder full_adder19_1(.a(data_A[1] & data_B[19]),.b(w18_218), .cin(wc19_019), .s(w19_119), .cout(wc19_119));
full_adder full_adder19_2(.a(data_A[2] & data_B[19]),.b(w18_318), .cin(wc19_119), .s(w19_219), .cout(wc19_219));
full_adder full_adder19_3(.a(data_A[3] & data_B[19]),.b(w18_418), .cin(wc19_219), .s(w19_319), .cout(wc19_319));
full_adder full_adder19_4(.a(data_A[4] & data_B[19]),.b(w18_518), .cin(wc19_319), .s(w19_419), .cout(wc19_419));
full_adder full_adder19_5(.a(data_A[5] & data_B[19]),.b(w18_618), .cin(wc19_419), .s(w19_519), .cout(wc19_519));
full_adder full_adder19_6(.a(data_A[6] & data_B[19]),.b(w18_718), .cin(wc19_519), .s(w19_619), .cout(wc19_619));
full_adder full_adder19_7(.a(data_A[7] & data_B[19]),.b(w18_818), .cin(wc19_619), .s(w19_719), .cout(wc19_719));
full_adder full_adder19_8(.a(data_A[8] & data_B[19]),.b(w18_918), .cin(wc19_719), .s(w19_819), .cout(wc19_819));
full_adder full_adder19_9(.a(data_A[9] & data_B[19]),.b(w18_1018), .cin(wc19_819), .s(w19_919), .cout(wc19_919));
full_adder full_adder19_10(.a(data_A[10] & data_B[19]),.b(w18_1118), .cin(wc19_919), .s(w19_1019), .cout(wc19_1019));
full_adder full_adder19_11(.a(data_A[11] & data_B[19]),.b(w18_1218), .cin(wc19_1019), .s(w19_1119), .cout(wc19_1119));
full_adder full_adder19_12(.a(data_A[12] & data_B[19]),.b(w18_1318), .cin(wc19_1119), .s(w19_1219), .cout(wc19_1219));
full_adder full_adder19_13(.a(data_A[13] & data_B[19]),.b(w18_1418), .cin(wc19_1219), .s(w19_1319), .cout(wc19_1319));
full_adder full_adder19_14(.a(data_A[14] & data_B[19]),.b(w18_1518), .cin(wc19_1319), .s(w19_1419), .cout(wc19_1419));
full_adder full_adder19_15(.a(data_A[15] & data_B[19]),.b(w18_1618), .cin(wc19_1419), .s(w19_1519), .cout(wc19_1519));
full_adder full_adder19_16(.a(data_A[16] & data_B[19]),.b(w18_1718), .cin(wc19_1519), .s(w19_1619), .cout(wc19_1619));
full_adder full_adder19_17(.a(data_A[17] & data_B[19]),.b(w18_1818), .cin(wc19_1619), .s(w19_1719), .cout(wc19_1719));
full_adder full_adder19_18(.a(data_A[18] & data_B[19]),.b(w18_1918), .cin(wc19_1719), .s(w19_1819), .cout(wc19_1819));
full_adder full_adder19_19(.a(data_A[19] & data_B[19]),.b(w18_2018), .cin(wc19_1819), .s(w19_1919), .cout(wc19_1919));
full_adder full_adder19_20(.a(data_A[20] & data_B[19]),.b(w18_2118), .cin(wc19_1919), .s(w19_2019), .cout(wc19_2019));
full_adder full_adder19_21(.a(data_A[21] & data_B[19]),.b(w18_2218), .cin(wc19_2019), .s(w19_2119), .cout(wc19_2119));
full_adder full_adder19_22(.a(data_A[22] & data_B[19]),.b(w18_2318), .cin(wc19_2119), .s(w19_2219), .cout(wc19_2219));
full_adder full_adder19_23(.a(data_A[23] & data_B[19]),.b(w18_2418), .cin(wc19_2219), .s(w19_2319), .cout(wc19_2319));
full_adder full_adder19_24(.a(data_A[24] & data_B[19]),.b(w18_2518), .cin(wc19_2319), .s(w19_2419), .cout(wc19_2419));
full_adder full_adder19_25(.a(data_A[25] & data_B[19]),.b(w18_2618), .cin(wc19_2419), .s(w19_2519), .cout(wc19_2519));
full_adder full_adder19_26(.a(data_A[26] & data_B[19]),.b(w18_2718), .cin(wc19_2519), .s(w19_2619), .cout(wc19_2619));
full_adder full_adder19_27(.a(data_A[27] & data_B[19]),.b(w18_2818), .cin(wc19_2619), .s(w19_2719), .cout(wc19_2719));
full_adder full_adder19_28(.a(data_A[28] & data_B[19]),.b(w18_2918), .cin(wc19_2719), .s(w19_2819), .cout(wc19_2819));
full_adder full_adder19_29(.a(data_A[29] & data_B[19]),.b(w18_3018), .cin(wc19_2819), .s(w19_2919), .cout(wc19_2919));
full_adder full_adder19_30(.a(data_A[30] & data_B[19]),.b(w18_3118), .cin(wc19_2919), .s(w19_3019), .cout(wc19_3019));
full_adder full_adder19_31(.a(~(data_A[31] & data_B[19])),.b(wc18_3118), .cin(wc19_3019), .s(w19_3119), .cout(wc19_3119));
assign mult_out[19] = w19_019;
half_adder half_adder20_0(.a(data_A[0] & data_B[20]), .b(w19_119), .s(w20_020), .cout(wc20_020));
full_adder full_adder20_1(.a(data_A[1] & data_B[20]),.b(w19_219), .cin(wc20_020), .s(w20_120), .cout(wc20_120));
full_adder full_adder20_2(.a(data_A[2] & data_B[20]),.b(w19_319), .cin(wc20_120), .s(w20_220), .cout(wc20_220));
full_adder full_adder20_3(.a(data_A[3] & data_B[20]),.b(w19_419), .cin(wc20_220), .s(w20_320), .cout(wc20_320));
full_adder full_adder20_4(.a(data_A[4] & data_B[20]),.b(w19_519), .cin(wc20_320), .s(w20_420), .cout(wc20_420));
full_adder full_adder20_5(.a(data_A[5] & data_B[20]),.b(w19_619), .cin(wc20_420), .s(w20_520), .cout(wc20_520));
full_adder full_adder20_6(.a(data_A[6] & data_B[20]),.b(w19_719), .cin(wc20_520), .s(w20_620), .cout(wc20_620));
full_adder full_adder20_7(.a(data_A[7] & data_B[20]),.b(w19_819), .cin(wc20_620), .s(w20_720), .cout(wc20_720));
full_adder full_adder20_8(.a(data_A[8] & data_B[20]),.b(w19_919), .cin(wc20_720), .s(w20_820), .cout(wc20_820));
full_adder full_adder20_9(.a(data_A[9] & data_B[20]),.b(w19_1019), .cin(wc20_820), .s(w20_920), .cout(wc20_920));
full_adder full_adder20_10(.a(data_A[10] & data_B[20]),.b(w19_1119), .cin(wc20_920), .s(w20_1020), .cout(wc20_1020));
full_adder full_adder20_11(.a(data_A[11] & data_B[20]),.b(w19_1219), .cin(wc20_1020), .s(w20_1120), .cout(wc20_1120));
full_adder full_adder20_12(.a(data_A[12] & data_B[20]),.b(w19_1319), .cin(wc20_1120), .s(w20_1220), .cout(wc20_1220));
full_adder full_adder20_13(.a(data_A[13] & data_B[20]),.b(w19_1419), .cin(wc20_1220), .s(w20_1320), .cout(wc20_1320));
full_adder full_adder20_14(.a(data_A[14] & data_B[20]),.b(w19_1519), .cin(wc20_1320), .s(w20_1420), .cout(wc20_1420));
full_adder full_adder20_15(.a(data_A[15] & data_B[20]),.b(w19_1619), .cin(wc20_1420), .s(w20_1520), .cout(wc20_1520));
full_adder full_adder20_16(.a(data_A[16] & data_B[20]),.b(w19_1719), .cin(wc20_1520), .s(w20_1620), .cout(wc20_1620));
full_adder full_adder20_17(.a(data_A[17] & data_B[20]),.b(w19_1819), .cin(wc20_1620), .s(w20_1720), .cout(wc20_1720));
full_adder full_adder20_18(.a(data_A[18] & data_B[20]),.b(w19_1919), .cin(wc20_1720), .s(w20_1820), .cout(wc20_1820));
full_adder full_adder20_19(.a(data_A[19] & data_B[20]),.b(w19_2019), .cin(wc20_1820), .s(w20_1920), .cout(wc20_1920));
full_adder full_adder20_20(.a(data_A[20] & data_B[20]),.b(w19_2119), .cin(wc20_1920), .s(w20_2020), .cout(wc20_2020));
full_adder full_adder20_21(.a(data_A[21] & data_B[20]),.b(w19_2219), .cin(wc20_2020), .s(w20_2120), .cout(wc20_2120));
full_adder full_adder20_22(.a(data_A[22] & data_B[20]),.b(w19_2319), .cin(wc20_2120), .s(w20_2220), .cout(wc20_2220));
full_adder full_adder20_23(.a(data_A[23] & data_B[20]),.b(w19_2419), .cin(wc20_2220), .s(w20_2320), .cout(wc20_2320));
full_adder full_adder20_24(.a(data_A[24] & data_B[20]),.b(w19_2519), .cin(wc20_2320), .s(w20_2420), .cout(wc20_2420));
full_adder full_adder20_25(.a(data_A[25] & data_B[20]),.b(w19_2619), .cin(wc20_2420), .s(w20_2520), .cout(wc20_2520));
full_adder full_adder20_26(.a(data_A[26] & data_B[20]),.b(w19_2719), .cin(wc20_2520), .s(w20_2620), .cout(wc20_2620));
full_adder full_adder20_27(.a(data_A[27] & data_B[20]),.b(w19_2819), .cin(wc20_2620), .s(w20_2720), .cout(wc20_2720));
full_adder full_adder20_28(.a(data_A[28] & data_B[20]),.b(w19_2919), .cin(wc20_2720), .s(w20_2820), .cout(wc20_2820));
full_adder full_adder20_29(.a(data_A[29] & data_B[20]),.b(w19_3019), .cin(wc20_2820), .s(w20_2920), .cout(wc20_2920));
full_adder full_adder20_30(.a(data_A[30] & data_B[20]),.b(w19_3119), .cin(wc20_2920), .s(w20_3020), .cout(wc20_3020));
full_adder full_adder20_31(.a(~(data_A[31] & data_B[20])),.b(wc19_3119), .cin(wc20_3020), .s(w20_3120), .cout(wc20_3120));
assign mult_out[20] = w20_020;
half_adder half_adder21_0(.a(data_A[0] & data_B[21]), .b(w20_120), .s(w21_021), .cout(wc21_021));
full_adder full_adder21_1(.a(data_A[1] & data_B[21]),.b(w20_220), .cin(wc21_021), .s(w21_121), .cout(wc21_121));
full_adder full_adder21_2(.a(data_A[2] & data_B[21]),.b(w20_320), .cin(wc21_121), .s(w21_221), .cout(wc21_221));
full_adder full_adder21_3(.a(data_A[3] & data_B[21]),.b(w20_420), .cin(wc21_221), .s(w21_321), .cout(wc21_321));
full_adder full_adder21_4(.a(data_A[4] & data_B[21]),.b(w20_520), .cin(wc21_321), .s(w21_421), .cout(wc21_421));
full_adder full_adder21_5(.a(data_A[5] & data_B[21]),.b(w20_620), .cin(wc21_421), .s(w21_521), .cout(wc21_521));
full_adder full_adder21_6(.a(data_A[6] & data_B[21]),.b(w20_720), .cin(wc21_521), .s(w21_621), .cout(wc21_621));
full_adder full_adder21_7(.a(data_A[7] & data_B[21]),.b(w20_820), .cin(wc21_621), .s(w21_721), .cout(wc21_721));
full_adder full_adder21_8(.a(data_A[8] & data_B[21]),.b(w20_920), .cin(wc21_721), .s(w21_821), .cout(wc21_821));
full_adder full_adder21_9(.a(data_A[9] & data_B[21]),.b(w20_1020), .cin(wc21_821), .s(w21_921), .cout(wc21_921));
full_adder full_adder21_10(.a(data_A[10] & data_B[21]),.b(w20_1120), .cin(wc21_921), .s(w21_1021), .cout(wc21_1021));
full_adder full_adder21_11(.a(data_A[11] & data_B[21]),.b(w20_1220), .cin(wc21_1021), .s(w21_1121), .cout(wc21_1121));
full_adder full_adder21_12(.a(data_A[12] & data_B[21]),.b(w20_1320), .cin(wc21_1121), .s(w21_1221), .cout(wc21_1221));
full_adder full_adder21_13(.a(data_A[13] & data_B[21]),.b(w20_1420), .cin(wc21_1221), .s(w21_1321), .cout(wc21_1321));
full_adder full_adder21_14(.a(data_A[14] & data_B[21]),.b(w20_1520), .cin(wc21_1321), .s(w21_1421), .cout(wc21_1421));
full_adder full_adder21_15(.a(data_A[15] & data_B[21]),.b(w20_1620), .cin(wc21_1421), .s(w21_1521), .cout(wc21_1521));
full_adder full_adder21_16(.a(data_A[16] & data_B[21]),.b(w20_1720), .cin(wc21_1521), .s(w21_1621), .cout(wc21_1621));
full_adder full_adder21_17(.a(data_A[17] & data_B[21]),.b(w20_1820), .cin(wc21_1621), .s(w21_1721), .cout(wc21_1721));
full_adder full_adder21_18(.a(data_A[18] & data_B[21]),.b(w20_1920), .cin(wc21_1721), .s(w21_1821), .cout(wc21_1821));
full_adder full_adder21_19(.a(data_A[19] & data_B[21]),.b(w20_2020), .cin(wc21_1821), .s(w21_1921), .cout(wc21_1921));
full_adder full_adder21_20(.a(data_A[20] & data_B[21]),.b(w20_2120), .cin(wc21_1921), .s(w21_2021), .cout(wc21_2021));
full_adder full_adder21_21(.a(data_A[21] & data_B[21]),.b(w20_2220), .cin(wc21_2021), .s(w21_2121), .cout(wc21_2121));
full_adder full_adder21_22(.a(data_A[22] & data_B[21]),.b(w20_2320), .cin(wc21_2121), .s(w21_2221), .cout(wc21_2221));
full_adder full_adder21_23(.a(data_A[23] & data_B[21]),.b(w20_2420), .cin(wc21_2221), .s(w21_2321), .cout(wc21_2321));
full_adder full_adder21_24(.a(data_A[24] & data_B[21]),.b(w20_2520), .cin(wc21_2321), .s(w21_2421), .cout(wc21_2421));
full_adder full_adder21_25(.a(data_A[25] & data_B[21]),.b(w20_2620), .cin(wc21_2421), .s(w21_2521), .cout(wc21_2521));
full_adder full_adder21_26(.a(data_A[26] & data_B[21]),.b(w20_2720), .cin(wc21_2521), .s(w21_2621), .cout(wc21_2621));
full_adder full_adder21_27(.a(data_A[27] & data_B[21]),.b(w20_2820), .cin(wc21_2621), .s(w21_2721), .cout(wc21_2721));
full_adder full_adder21_28(.a(data_A[28] & data_B[21]),.b(w20_2920), .cin(wc21_2721), .s(w21_2821), .cout(wc21_2821));
full_adder full_adder21_29(.a(data_A[29] & data_B[21]),.b(w20_3020), .cin(wc21_2821), .s(w21_2921), .cout(wc21_2921));
full_adder full_adder21_30(.a(data_A[30] & data_B[21]),.b(w20_3120), .cin(wc21_2921), .s(w21_3021), .cout(wc21_3021));
full_adder full_adder21_31(.a(~(data_A[31] & data_B[21])),.b(wc20_3120), .cin(wc21_3021), .s(w21_3121), .cout(wc21_3121));
assign mult_out[21] = w21_021;
half_adder half_adder22_0(.a(data_A[0] & data_B[22]), .b(w21_121), .s(w22_022), .cout(wc22_022));
full_adder full_adder22_1(.a(data_A[1] & data_B[22]),.b(w21_221), .cin(wc22_022), .s(w22_122), .cout(wc22_122));
full_adder full_adder22_2(.a(data_A[2] & data_B[22]),.b(w21_321), .cin(wc22_122), .s(w22_222), .cout(wc22_222));
full_adder full_adder22_3(.a(data_A[3] & data_B[22]),.b(w21_421), .cin(wc22_222), .s(w22_322), .cout(wc22_322));
full_adder full_adder22_4(.a(data_A[4] & data_B[22]),.b(w21_521), .cin(wc22_322), .s(w22_422), .cout(wc22_422));
full_adder full_adder22_5(.a(data_A[5] & data_B[22]),.b(w21_621), .cin(wc22_422), .s(w22_522), .cout(wc22_522));
full_adder full_adder22_6(.a(data_A[6] & data_B[22]),.b(w21_721), .cin(wc22_522), .s(w22_622), .cout(wc22_622));
full_adder full_adder22_7(.a(data_A[7] & data_B[22]),.b(w21_821), .cin(wc22_622), .s(w22_722), .cout(wc22_722));
full_adder full_adder22_8(.a(data_A[8] & data_B[22]),.b(w21_921), .cin(wc22_722), .s(w22_822), .cout(wc22_822));
full_adder full_adder22_9(.a(data_A[9] & data_B[22]),.b(w21_1021), .cin(wc22_822), .s(w22_922), .cout(wc22_922));
full_adder full_adder22_10(.a(data_A[10] & data_B[22]),.b(w21_1121), .cin(wc22_922), .s(w22_1022), .cout(wc22_1022));
full_adder full_adder22_11(.a(data_A[11] & data_B[22]),.b(w21_1221), .cin(wc22_1022), .s(w22_1122), .cout(wc22_1122));
full_adder full_adder22_12(.a(data_A[12] & data_B[22]),.b(w21_1321), .cin(wc22_1122), .s(w22_1222), .cout(wc22_1222));
full_adder full_adder22_13(.a(data_A[13] & data_B[22]),.b(w21_1421), .cin(wc22_1222), .s(w22_1322), .cout(wc22_1322));
full_adder full_adder22_14(.a(data_A[14] & data_B[22]),.b(w21_1521), .cin(wc22_1322), .s(w22_1422), .cout(wc22_1422));
full_adder full_adder22_15(.a(data_A[15] & data_B[22]),.b(w21_1621), .cin(wc22_1422), .s(w22_1522), .cout(wc22_1522));
full_adder full_adder22_16(.a(data_A[16] & data_B[22]),.b(w21_1721), .cin(wc22_1522), .s(w22_1622), .cout(wc22_1622));
full_adder full_adder22_17(.a(data_A[17] & data_B[22]),.b(w21_1821), .cin(wc22_1622), .s(w22_1722), .cout(wc22_1722));
full_adder full_adder22_18(.a(data_A[18] & data_B[22]),.b(w21_1921), .cin(wc22_1722), .s(w22_1822), .cout(wc22_1822));
full_adder full_adder22_19(.a(data_A[19] & data_B[22]),.b(w21_2021), .cin(wc22_1822), .s(w22_1922), .cout(wc22_1922));
full_adder full_adder22_20(.a(data_A[20] & data_B[22]),.b(w21_2121), .cin(wc22_1922), .s(w22_2022), .cout(wc22_2022));
full_adder full_adder22_21(.a(data_A[21] & data_B[22]),.b(w21_2221), .cin(wc22_2022), .s(w22_2122), .cout(wc22_2122));
full_adder full_adder22_22(.a(data_A[22] & data_B[22]),.b(w21_2321), .cin(wc22_2122), .s(w22_2222), .cout(wc22_2222));
full_adder full_adder22_23(.a(data_A[23] & data_B[22]),.b(w21_2421), .cin(wc22_2222), .s(w22_2322), .cout(wc22_2322));
full_adder full_adder22_24(.a(data_A[24] & data_B[22]),.b(w21_2521), .cin(wc22_2322), .s(w22_2422), .cout(wc22_2422));
full_adder full_adder22_25(.a(data_A[25] & data_B[22]),.b(w21_2621), .cin(wc22_2422), .s(w22_2522), .cout(wc22_2522));
full_adder full_adder22_26(.a(data_A[26] & data_B[22]),.b(w21_2721), .cin(wc22_2522), .s(w22_2622), .cout(wc22_2622));
full_adder full_adder22_27(.a(data_A[27] & data_B[22]),.b(w21_2821), .cin(wc22_2622), .s(w22_2722), .cout(wc22_2722));
full_adder full_adder22_28(.a(data_A[28] & data_B[22]),.b(w21_2921), .cin(wc22_2722), .s(w22_2822), .cout(wc22_2822));
full_adder full_adder22_29(.a(data_A[29] & data_B[22]),.b(w21_3021), .cin(wc22_2822), .s(w22_2922), .cout(wc22_2922));
full_adder full_adder22_30(.a(data_A[30] & data_B[22]),.b(w21_3121), .cin(wc22_2922), .s(w22_3022), .cout(wc22_3022));
full_adder full_adder22_31(.a(~(data_A[31] & data_B[22])),.b(wc21_3121), .cin(wc22_3022), .s(w22_3122), .cout(wc22_3122));
assign mult_out[22] = w22_022;
half_adder half_adder23_0(.a(data_A[0] & data_B[23]), .b(w22_122), .s(w23_023), .cout(wc23_023));
full_adder full_adder23_1(.a(data_A[1] & data_B[23]),.b(w22_222), .cin(wc23_023), .s(w23_123), .cout(wc23_123));
full_adder full_adder23_2(.a(data_A[2] & data_B[23]),.b(w22_322), .cin(wc23_123), .s(w23_223), .cout(wc23_223));
full_adder full_adder23_3(.a(data_A[3] & data_B[23]),.b(w22_422), .cin(wc23_223), .s(w23_323), .cout(wc23_323));
full_adder full_adder23_4(.a(data_A[4] & data_B[23]),.b(w22_522), .cin(wc23_323), .s(w23_423), .cout(wc23_423));
full_adder full_adder23_5(.a(data_A[5] & data_B[23]),.b(w22_622), .cin(wc23_423), .s(w23_523), .cout(wc23_523));
full_adder full_adder23_6(.a(data_A[6] & data_B[23]),.b(w22_722), .cin(wc23_523), .s(w23_623), .cout(wc23_623));
full_adder full_adder23_7(.a(data_A[7] & data_B[23]),.b(w22_822), .cin(wc23_623), .s(w23_723), .cout(wc23_723));
full_adder full_adder23_8(.a(data_A[8] & data_B[23]),.b(w22_922), .cin(wc23_723), .s(w23_823), .cout(wc23_823));
full_adder full_adder23_9(.a(data_A[9] & data_B[23]),.b(w22_1022), .cin(wc23_823), .s(w23_923), .cout(wc23_923));
full_adder full_adder23_10(.a(data_A[10] & data_B[23]),.b(w22_1122), .cin(wc23_923), .s(w23_1023), .cout(wc23_1023));
full_adder full_adder23_11(.a(data_A[11] & data_B[23]),.b(w22_1222), .cin(wc23_1023), .s(w23_1123), .cout(wc23_1123));
full_adder full_adder23_12(.a(data_A[12] & data_B[23]),.b(w22_1322), .cin(wc23_1123), .s(w23_1223), .cout(wc23_1223));
full_adder full_adder23_13(.a(data_A[13] & data_B[23]),.b(w22_1422), .cin(wc23_1223), .s(w23_1323), .cout(wc23_1323));
full_adder full_adder23_14(.a(data_A[14] & data_B[23]),.b(w22_1522), .cin(wc23_1323), .s(w23_1423), .cout(wc23_1423));
full_adder full_adder23_15(.a(data_A[15] & data_B[23]),.b(w22_1622), .cin(wc23_1423), .s(w23_1523), .cout(wc23_1523));
full_adder full_adder23_16(.a(data_A[16] & data_B[23]),.b(w22_1722), .cin(wc23_1523), .s(w23_1623), .cout(wc23_1623));
full_adder full_adder23_17(.a(data_A[17] & data_B[23]),.b(w22_1822), .cin(wc23_1623), .s(w23_1723), .cout(wc23_1723));
full_adder full_adder23_18(.a(data_A[18] & data_B[23]),.b(w22_1922), .cin(wc23_1723), .s(w23_1823), .cout(wc23_1823));
full_adder full_adder23_19(.a(data_A[19] & data_B[23]),.b(w22_2022), .cin(wc23_1823), .s(w23_1923), .cout(wc23_1923));
full_adder full_adder23_20(.a(data_A[20] & data_B[23]),.b(w22_2122), .cin(wc23_1923), .s(w23_2023), .cout(wc23_2023));
full_adder full_adder23_21(.a(data_A[21] & data_B[23]),.b(w22_2222), .cin(wc23_2023), .s(w23_2123), .cout(wc23_2123));
full_adder full_adder23_22(.a(data_A[22] & data_B[23]),.b(w22_2322), .cin(wc23_2123), .s(w23_2223), .cout(wc23_2223));
full_adder full_adder23_23(.a(data_A[23] & data_B[23]),.b(w22_2422), .cin(wc23_2223), .s(w23_2323), .cout(wc23_2323));
full_adder full_adder23_24(.a(data_A[24] & data_B[23]),.b(w22_2522), .cin(wc23_2323), .s(w23_2423), .cout(wc23_2423));
full_adder full_adder23_25(.a(data_A[25] & data_B[23]),.b(w22_2622), .cin(wc23_2423), .s(w23_2523), .cout(wc23_2523));
full_adder full_adder23_26(.a(data_A[26] & data_B[23]),.b(w22_2722), .cin(wc23_2523), .s(w23_2623), .cout(wc23_2623));
full_adder full_adder23_27(.a(data_A[27] & data_B[23]),.b(w22_2822), .cin(wc23_2623), .s(w23_2723), .cout(wc23_2723));
full_adder full_adder23_28(.a(data_A[28] & data_B[23]),.b(w22_2922), .cin(wc23_2723), .s(w23_2823), .cout(wc23_2823));
full_adder full_adder23_29(.a(data_A[29] & data_B[23]),.b(w22_3022), .cin(wc23_2823), .s(w23_2923), .cout(wc23_2923));
full_adder full_adder23_30(.a(data_A[30] & data_B[23]),.b(w22_3122), .cin(wc23_2923), .s(w23_3023), .cout(wc23_3023));
full_adder full_adder23_31(.a(~(data_A[31] & data_B[23])),.b(wc22_3122), .cin(wc23_3023), .s(w23_3123), .cout(wc23_3123));
assign mult_out[23] = w23_023;
half_adder half_adder24_0(.a(data_A[0] & data_B[24]), .b(w23_123), .s(w24_024), .cout(wc24_024));
full_adder full_adder24_1(.a(data_A[1] & data_B[24]),.b(w23_223), .cin(wc24_024), .s(w24_124), .cout(wc24_124));
full_adder full_adder24_2(.a(data_A[2] & data_B[24]),.b(w23_323), .cin(wc24_124), .s(w24_224), .cout(wc24_224));
full_adder full_adder24_3(.a(data_A[3] & data_B[24]),.b(w23_423), .cin(wc24_224), .s(w24_324), .cout(wc24_324));
full_adder full_adder24_4(.a(data_A[4] & data_B[24]),.b(w23_523), .cin(wc24_324), .s(w24_424), .cout(wc24_424));
full_adder full_adder24_5(.a(data_A[5] & data_B[24]),.b(w23_623), .cin(wc24_424), .s(w24_524), .cout(wc24_524));
full_adder full_adder24_6(.a(data_A[6] & data_B[24]),.b(w23_723), .cin(wc24_524), .s(w24_624), .cout(wc24_624));
full_adder full_adder24_7(.a(data_A[7] & data_B[24]),.b(w23_823), .cin(wc24_624), .s(w24_724), .cout(wc24_724));
full_adder full_adder24_8(.a(data_A[8] & data_B[24]),.b(w23_923), .cin(wc24_724), .s(w24_824), .cout(wc24_824));
full_adder full_adder24_9(.a(data_A[9] & data_B[24]),.b(w23_1023), .cin(wc24_824), .s(w24_924), .cout(wc24_924));
full_adder full_adder24_10(.a(data_A[10] & data_B[24]),.b(w23_1123), .cin(wc24_924), .s(w24_1024), .cout(wc24_1024));
full_adder full_adder24_11(.a(data_A[11] & data_B[24]),.b(w23_1223), .cin(wc24_1024), .s(w24_1124), .cout(wc24_1124));
full_adder full_adder24_12(.a(data_A[12] & data_B[24]),.b(w23_1323), .cin(wc24_1124), .s(w24_1224), .cout(wc24_1224));
full_adder full_adder24_13(.a(data_A[13] & data_B[24]),.b(w23_1423), .cin(wc24_1224), .s(w24_1324), .cout(wc24_1324));
full_adder full_adder24_14(.a(data_A[14] & data_B[24]),.b(w23_1523), .cin(wc24_1324), .s(w24_1424), .cout(wc24_1424));
full_adder full_adder24_15(.a(data_A[15] & data_B[24]),.b(w23_1623), .cin(wc24_1424), .s(w24_1524), .cout(wc24_1524));
full_adder full_adder24_16(.a(data_A[16] & data_B[24]),.b(w23_1723), .cin(wc24_1524), .s(w24_1624), .cout(wc24_1624));
full_adder full_adder24_17(.a(data_A[17] & data_B[24]),.b(w23_1823), .cin(wc24_1624), .s(w24_1724), .cout(wc24_1724));
full_adder full_adder24_18(.a(data_A[18] & data_B[24]),.b(w23_1923), .cin(wc24_1724), .s(w24_1824), .cout(wc24_1824));
full_adder full_adder24_19(.a(data_A[19] & data_B[24]),.b(w23_2023), .cin(wc24_1824), .s(w24_1924), .cout(wc24_1924));
full_adder full_adder24_20(.a(data_A[20] & data_B[24]),.b(w23_2123), .cin(wc24_1924), .s(w24_2024), .cout(wc24_2024));
full_adder full_adder24_21(.a(data_A[21] & data_B[24]),.b(w23_2223), .cin(wc24_2024), .s(w24_2124), .cout(wc24_2124));
full_adder full_adder24_22(.a(data_A[22] & data_B[24]),.b(w23_2323), .cin(wc24_2124), .s(w24_2224), .cout(wc24_2224));
full_adder full_adder24_23(.a(data_A[23] & data_B[24]),.b(w23_2423), .cin(wc24_2224), .s(w24_2324), .cout(wc24_2324));
full_adder full_adder24_24(.a(data_A[24] & data_B[24]),.b(w23_2523), .cin(wc24_2324), .s(w24_2424), .cout(wc24_2424));
full_adder full_adder24_25(.a(data_A[25] & data_B[24]),.b(w23_2623), .cin(wc24_2424), .s(w24_2524), .cout(wc24_2524));
full_adder full_adder24_26(.a(data_A[26] & data_B[24]),.b(w23_2723), .cin(wc24_2524), .s(w24_2624), .cout(wc24_2624));
full_adder full_adder24_27(.a(data_A[27] & data_B[24]),.b(w23_2823), .cin(wc24_2624), .s(w24_2724), .cout(wc24_2724));
full_adder full_adder24_28(.a(data_A[28] & data_B[24]),.b(w23_2923), .cin(wc24_2724), .s(w24_2824), .cout(wc24_2824));
full_adder full_adder24_29(.a(data_A[29] & data_B[24]),.b(w23_3023), .cin(wc24_2824), .s(w24_2924), .cout(wc24_2924));
full_adder full_adder24_30(.a(data_A[30] & data_B[24]),.b(w23_3123), .cin(wc24_2924), .s(w24_3024), .cout(wc24_3024));
full_adder full_adder24_31(.a(~(data_A[31] & data_B[24])),.b(wc23_3123), .cin(wc24_3024), .s(w24_3124), .cout(wc24_3124));
assign mult_out[24] = w24_024;
half_adder half_adder25_0(.a(data_A[0] & data_B[25]), .b(w24_124), .s(w25_025), .cout(wc25_025));
full_adder full_adder25_1(.a(data_A[1] & data_B[25]),.b(w24_224), .cin(wc25_025), .s(w25_125), .cout(wc25_125));
full_adder full_adder25_2(.a(data_A[2] & data_B[25]),.b(w24_324), .cin(wc25_125), .s(w25_225), .cout(wc25_225));
full_adder full_adder25_3(.a(data_A[3] & data_B[25]),.b(w24_424), .cin(wc25_225), .s(w25_325), .cout(wc25_325));
full_adder full_adder25_4(.a(data_A[4] & data_B[25]),.b(w24_524), .cin(wc25_325), .s(w25_425), .cout(wc25_425));
full_adder full_adder25_5(.a(data_A[5] & data_B[25]),.b(w24_624), .cin(wc25_425), .s(w25_525), .cout(wc25_525));
full_adder full_adder25_6(.a(data_A[6] & data_B[25]),.b(w24_724), .cin(wc25_525), .s(w25_625), .cout(wc25_625));
full_adder full_adder25_7(.a(data_A[7] & data_B[25]),.b(w24_824), .cin(wc25_625), .s(w25_725), .cout(wc25_725));
full_adder full_adder25_8(.a(data_A[8] & data_B[25]),.b(w24_924), .cin(wc25_725), .s(w25_825), .cout(wc25_825));
full_adder full_adder25_9(.a(data_A[9] & data_B[25]),.b(w24_1024), .cin(wc25_825), .s(w25_925), .cout(wc25_925));
full_adder full_adder25_10(.a(data_A[10] & data_B[25]),.b(w24_1124), .cin(wc25_925), .s(w25_1025), .cout(wc25_1025));
full_adder full_adder25_11(.a(data_A[11] & data_B[25]),.b(w24_1224), .cin(wc25_1025), .s(w25_1125), .cout(wc25_1125));
full_adder full_adder25_12(.a(data_A[12] & data_B[25]),.b(w24_1324), .cin(wc25_1125), .s(w25_1225), .cout(wc25_1225));
full_adder full_adder25_13(.a(data_A[13] & data_B[25]),.b(w24_1424), .cin(wc25_1225), .s(w25_1325), .cout(wc25_1325));
full_adder full_adder25_14(.a(data_A[14] & data_B[25]),.b(w24_1524), .cin(wc25_1325), .s(w25_1425), .cout(wc25_1425));
full_adder full_adder25_15(.a(data_A[15] & data_B[25]),.b(w24_1624), .cin(wc25_1425), .s(w25_1525), .cout(wc25_1525));
full_adder full_adder25_16(.a(data_A[16] & data_B[25]),.b(w24_1724), .cin(wc25_1525), .s(w25_1625), .cout(wc25_1625));
full_adder full_adder25_17(.a(data_A[17] & data_B[25]),.b(w24_1824), .cin(wc25_1625), .s(w25_1725), .cout(wc25_1725));
full_adder full_adder25_18(.a(data_A[18] & data_B[25]),.b(w24_1924), .cin(wc25_1725), .s(w25_1825), .cout(wc25_1825));
full_adder full_adder25_19(.a(data_A[19] & data_B[25]),.b(w24_2024), .cin(wc25_1825), .s(w25_1925), .cout(wc25_1925));
full_adder full_adder25_20(.a(data_A[20] & data_B[25]),.b(w24_2124), .cin(wc25_1925), .s(w25_2025), .cout(wc25_2025));
full_adder full_adder25_21(.a(data_A[21] & data_B[25]),.b(w24_2224), .cin(wc25_2025), .s(w25_2125), .cout(wc25_2125));
full_adder full_adder25_22(.a(data_A[22] & data_B[25]),.b(w24_2324), .cin(wc25_2125), .s(w25_2225), .cout(wc25_2225));
full_adder full_adder25_23(.a(data_A[23] & data_B[25]),.b(w24_2424), .cin(wc25_2225), .s(w25_2325), .cout(wc25_2325));
full_adder full_adder25_24(.a(data_A[24] & data_B[25]),.b(w24_2524), .cin(wc25_2325), .s(w25_2425), .cout(wc25_2425));
full_adder full_adder25_25(.a(data_A[25] & data_B[25]),.b(w24_2624), .cin(wc25_2425), .s(w25_2525), .cout(wc25_2525));
full_adder full_adder25_26(.a(data_A[26] & data_B[25]),.b(w24_2724), .cin(wc25_2525), .s(w25_2625), .cout(wc25_2625));
full_adder full_adder25_27(.a(data_A[27] & data_B[25]),.b(w24_2824), .cin(wc25_2625), .s(w25_2725), .cout(wc25_2725));
full_adder full_adder25_28(.a(data_A[28] & data_B[25]),.b(w24_2924), .cin(wc25_2725), .s(w25_2825), .cout(wc25_2825));
full_adder full_adder25_29(.a(data_A[29] & data_B[25]),.b(w24_3024), .cin(wc25_2825), .s(w25_2925), .cout(wc25_2925));
full_adder full_adder25_30(.a(data_A[30] & data_B[25]),.b(w24_3124), .cin(wc25_2925), .s(w25_3025), .cout(wc25_3025));
full_adder full_adder25_31(.a(~(data_A[31] & data_B[25])),.b(wc24_3124), .cin(wc25_3025), .s(w25_3125), .cout(wc25_3125));
assign mult_out[25] = w25_025;
half_adder half_adder26_0(.a(data_A[0] & data_B[26]), .b(w25_125), .s(w26_026), .cout(wc26_026));
full_adder full_adder26_1(.a(data_A[1] & data_B[26]),.b(w25_225), .cin(wc26_026), .s(w26_126), .cout(wc26_126));
full_adder full_adder26_2(.a(data_A[2] & data_B[26]),.b(w25_325), .cin(wc26_126), .s(w26_226), .cout(wc26_226));
full_adder full_adder26_3(.a(data_A[3] & data_B[26]),.b(w25_425), .cin(wc26_226), .s(w26_326), .cout(wc26_326));
full_adder full_adder26_4(.a(data_A[4] & data_B[26]),.b(w25_525), .cin(wc26_326), .s(w26_426), .cout(wc26_426));
full_adder full_adder26_5(.a(data_A[5] & data_B[26]),.b(w25_625), .cin(wc26_426), .s(w26_526), .cout(wc26_526));
full_adder full_adder26_6(.a(data_A[6] & data_B[26]),.b(w25_725), .cin(wc26_526), .s(w26_626), .cout(wc26_626));
full_adder full_adder26_7(.a(data_A[7] & data_B[26]),.b(w25_825), .cin(wc26_626), .s(w26_726), .cout(wc26_726));
full_adder full_adder26_8(.a(data_A[8] & data_B[26]),.b(w25_925), .cin(wc26_726), .s(w26_826), .cout(wc26_826));
full_adder full_adder26_9(.a(data_A[9] & data_B[26]),.b(w25_1025), .cin(wc26_826), .s(w26_926), .cout(wc26_926));
full_adder full_adder26_10(.a(data_A[10] & data_B[26]),.b(w25_1125), .cin(wc26_926), .s(w26_1026), .cout(wc26_1026));
full_adder full_adder26_11(.a(data_A[11] & data_B[26]),.b(w25_1225), .cin(wc26_1026), .s(w26_1126), .cout(wc26_1126));
full_adder full_adder26_12(.a(data_A[12] & data_B[26]),.b(w25_1325), .cin(wc26_1126), .s(w26_1226), .cout(wc26_1226));
full_adder full_adder26_13(.a(data_A[13] & data_B[26]),.b(w25_1425), .cin(wc26_1226), .s(w26_1326), .cout(wc26_1326));
full_adder full_adder26_14(.a(data_A[14] & data_B[26]),.b(w25_1525), .cin(wc26_1326), .s(w26_1426), .cout(wc26_1426));
full_adder full_adder26_15(.a(data_A[15] & data_B[26]),.b(w25_1625), .cin(wc26_1426), .s(w26_1526), .cout(wc26_1526));
full_adder full_adder26_16(.a(data_A[16] & data_B[26]),.b(w25_1725), .cin(wc26_1526), .s(w26_1626), .cout(wc26_1626));
full_adder full_adder26_17(.a(data_A[17] & data_B[26]),.b(w25_1825), .cin(wc26_1626), .s(w26_1726), .cout(wc26_1726));
full_adder full_adder26_18(.a(data_A[18] & data_B[26]),.b(w25_1925), .cin(wc26_1726), .s(w26_1826), .cout(wc26_1826));
full_adder full_adder26_19(.a(data_A[19] & data_B[26]),.b(w25_2025), .cin(wc26_1826), .s(w26_1926), .cout(wc26_1926));
full_adder full_adder26_20(.a(data_A[20] & data_B[26]),.b(w25_2125), .cin(wc26_1926), .s(w26_2026), .cout(wc26_2026));
full_adder full_adder26_21(.a(data_A[21] & data_B[26]),.b(w25_2225), .cin(wc26_2026), .s(w26_2126), .cout(wc26_2126));
full_adder full_adder26_22(.a(data_A[22] & data_B[26]),.b(w25_2325), .cin(wc26_2126), .s(w26_2226), .cout(wc26_2226));
full_adder full_adder26_23(.a(data_A[23] & data_B[26]),.b(w25_2425), .cin(wc26_2226), .s(w26_2326), .cout(wc26_2326));
full_adder full_adder26_24(.a(data_A[24] & data_B[26]),.b(w25_2525), .cin(wc26_2326), .s(w26_2426), .cout(wc26_2426));
full_adder full_adder26_25(.a(data_A[25] & data_B[26]),.b(w25_2625), .cin(wc26_2426), .s(w26_2526), .cout(wc26_2526));
full_adder full_adder26_26(.a(data_A[26] & data_B[26]),.b(w25_2725), .cin(wc26_2526), .s(w26_2626), .cout(wc26_2626));
full_adder full_adder26_27(.a(data_A[27] & data_B[26]),.b(w25_2825), .cin(wc26_2626), .s(w26_2726), .cout(wc26_2726));
full_adder full_adder26_28(.a(data_A[28] & data_B[26]),.b(w25_2925), .cin(wc26_2726), .s(w26_2826), .cout(wc26_2826));
full_adder full_adder26_29(.a(data_A[29] & data_B[26]),.b(w25_3025), .cin(wc26_2826), .s(w26_2926), .cout(wc26_2926));
full_adder full_adder26_30(.a(data_A[30] & data_B[26]),.b(w25_3125), .cin(wc26_2926), .s(w26_3026), .cout(wc26_3026));
full_adder full_adder26_31(.a(~(data_A[31] & data_B[26])),.b(wc25_3125), .cin(wc26_3026), .s(w26_3126), .cout(wc26_3126));
assign mult_out[26] = w26_026;
half_adder half_adder27_0(.a(data_A[0] & data_B[27]), .b(w26_126), .s(w27_027), .cout(wc27_027));
full_adder full_adder27_1(.a(data_A[1] & data_B[27]),.b(w26_226), .cin(wc27_027), .s(w27_127), .cout(wc27_127));
full_adder full_adder27_2(.a(data_A[2] & data_B[27]),.b(w26_326), .cin(wc27_127), .s(w27_227), .cout(wc27_227));
full_adder full_adder27_3(.a(data_A[3] & data_B[27]),.b(w26_426), .cin(wc27_227), .s(w27_327), .cout(wc27_327));
full_adder full_adder27_4(.a(data_A[4] & data_B[27]),.b(w26_526), .cin(wc27_327), .s(w27_427), .cout(wc27_427));
full_adder full_adder27_5(.a(data_A[5] & data_B[27]),.b(w26_626), .cin(wc27_427), .s(w27_527), .cout(wc27_527));
full_adder full_adder27_6(.a(data_A[6] & data_B[27]),.b(w26_726), .cin(wc27_527), .s(w27_627), .cout(wc27_627));
full_adder full_adder27_7(.a(data_A[7] & data_B[27]),.b(w26_826), .cin(wc27_627), .s(w27_727), .cout(wc27_727));
full_adder full_adder27_8(.a(data_A[8] & data_B[27]),.b(w26_926), .cin(wc27_727), .s(w27_827), .cout(wc27_827));
full_adder full_adder27_9(.a(data_A[9] & data_B[27]),.b(w26_1026), .cin(wc27_827), .s(w27_927), .cout(wc27_927));
full_adder full_adder27_10(.a(data_A[10] & data_B[27]),.b(w26_1126), .cin(wc27_927), .s(w27_1027), .cout(wc27_1027));
full_adder full_adder27_11(.a(data_A[11] & data_B[27]),.b(w26_1226), .cin(wc27_1027), .s(w27_1127), .cout(wc27_1127));
full_adder full_adder27_12(.a(data_A[12] & data_B[27]),.b(w26_1326), .cin(wc27_1127), .s(w27_1227), .cout(wc27_1227));
full_adder full_adder27_13(.a(data_A[13] & data_B[27]),.b(w26_1426), .cin(wc27_1227), .s(w27_1327), .cout(wc27_1327));
full_adder full_adder27_14(.a(data_A[14] & data_B[27]),.b(w26_1526), .cin(wc27_1327), .s(w27_1427), .cout(wc27_1427));
full_adder full_adder27_15(.a(data_A[15] & data_B[27]),.b(w26_1626), .cin(wc27_1427), .s(w27_1527), .cout(wc27_1527));
full_adder full_adder27_16(.a(data_A[16] & data_B[27]),.b(w26_1726), .cin(wc27_1527), .s(w27_1627), .cout(wc27_1627));
full_adder full_adder27_17(.a(data_A[17] & data_B[27]),.b(w26_1826), .cin(wc27_1627), .s(w27_1727), .cout(wc27_1727));
full_adder full_adder27_18(.a(data_A[18] & data_B[27]),.b(w26_1926), .cin(wc27_1727), .s(w27_1827), .cout(wc27_1827));
full_adder full_adder27_19(.a(data_A[19] & data_B[27]),.b(w26_2026), .cin(wc27_1827), .s(w27_1927), .cout(wc27_1927));
full_adder full_adder27_20(.a(data_A[20] & data_B[27]),.b(w26_2126), .cin(wc27_1927), .s(w27_2027), .cout(wc27_2027));
full_adder full_adder27_21(.a(data_A[21] & data_B[27]),.b(w26_2226), .cin(wc27_2027), .s(w27_2127), .cout(wc27_2127));
full_adder full_adder27_22(.a(data_A[22] & data_B[27]),.b(w26_2326), .cin(wc27_2127), .s(w27_2227), .cout(wc27_2227));
full_adder full_adder27_23(.a(data_A[23] & data_B[27]),.b(w26_2426), .cin(wc27_2227), .s(w27_2327), .cout(wc27_2327));
full_adder full_adder27_24(.a(data_A[24] & data_B[27]),.b(w26_2526), .cin(wc27_2327), .s(w27_2427), .cout(wc27_2427));
full_adder full_adder27_25(.a(data_A[25] & data_B[27]),.b(w26_2626), .cin(wc27_2427), .s(w27_2527), .cout(wc27_2527));
full_adder full_adder27_26(.a(data_A[26] & data_B[27]),.b(w26_2726), .cin(wc27_2527), .s(w27_2627), .cout(wc27_2627));
full_adder full_adder27_27(.a(data_A[27] & data_B[27]),.b(w26_2826), .cin(wc27_2627), .s(w27_2727), .cout(wc27_2727));
full_adder full_adder27_28(.a(data_A[28] & data_B[27]),.b(w26_2926), .cin(wc27_2727), .s(w27_2827), .cout(wc27_2827));
full_adder full_adder27_29(.a(data_A[29] & data_B[27]),.b(w26_3026), .cin(wc27_2827), .s(w27_2927), .cout(wc27_2927));
full_adder full_adder27_30(.a(data_A[30] & data_B[27]),.b(w26_3126), .cin(wc27_2927), .s(w27_3027), .cout(wc27_3027));
full_adder full_adder27_31(.a(~(data_A[31] & data_B[27])),.b(wc26_3126), .cin(wc27_3027), .s(w27_3127), .cout(wc27_3127));
assign mult_out[27] = w27_027;
half_adder half_adder28_0(.a(data_A[0] & data_B[28]), .b(w27_127), .s(w28_028), .cout(wc28_028));
full_adder full_adder28_1(.a(data_A[1] & data_B[28]),.b(w27_227), .cin(wc28_028), .s(w28_128), .cout(wc28_128));
full_adder full_adder28_2(.a(data_A[2] & data_B[28]),.b(w27_327), .cin(wc28_128), .s(w28_228), .cout(wc28_228));
full_adder full_adder28_3(.a(data_A[3] & data_B[28]),.b(w27_427), .cin(wc28_228), .s(w28_328), .cout(wc28_328));
full_adder full_adder28_4(.a(data_A[4] & data_B[28]),.b(w27_527), .cin(wc28_328), .s(w28_428), .cout(wc28_428));
full_adder full_adder28_5(.a(data_A[5] & data_B[28]),.b(w27_627), .cin(wc28_428), .s(w28_528), .cout(wc28_528));
full_adder full_adder28_6(.a(data_A[6] & data_B[28]),.b(w27_727), .cin(wc28_528), .s(w28_628), .cout(wc28_628));
full_adder full_adder28_7(.a(data_A[7] & data_B[28]),.b(w27_827), .cin(wc28_628), .s(w28_728), .cout(wc28_728));
full_adder full_adder28_8(.a(data_A[8] & data_B[28]),.b(w27_927), .cin(wc28_728), .s(w28_828), .cout(wc28_828));
full_adder full_adder28_9(.a(data_A[9] & data_B[28]),.b(w27_1027), .cin(wc28_828), .s(w28_928), .cout(wc28_928));
full_adder full_adder28_10(.a(data_A[10] & data_B[28]),.b(w27_1127), .cin(wc28_928), .s(w28_1028), .cout(wc28_1028));
full_adder full_adder28_11(.a(data_A[11] & data_B[28]),.b(w27_1227), .cin(wc28_1028), .s(w28_1128), .cout(wc28_1128));
full_adder full_adder28_12(.a(data_A[12] & data_B[28]),.b(w27_1327), .cin(wc28_1128), .s(w28_1228), .cout(wc28_1228));
full_adder full_adder28_13(.a(data_A[13] & data_B[28]),.b(w27_1427), .cin(wc28_1228), .s(w28_1328), .cout(wc28_1328));
full_adder full_adder28_14(.a(data_A[14] & data_B[28]),.b(w27_1527), .cin(wc28_1328), .s(w28_1428), .cout(wc28_1428));
full_adder full_adder28_15(.a(data_A[15] & data_B[28]),.b(w27_1627), .cin(wc28_1428), .s(w28_1528), .cout(wc28_1528));
full_adder full_adder28_16(.a(data_A[16] & data_B[28]),.b(w27_1727), .cin(wc28_1528), .s(w28_1628), .cout(wc28_1628));
full_adder full_adder28_17(.a(data_A[17] & data_B[28]),.b(w27_1827), .cin(wc28_1628), .s(w28_1728), .cout(wc28_1728));
full_adder full_adder28_18(.a(data_A[18] & data_B[28]),.b(w27_1927), .cin(wc28_1728), .s(w28_1828), .cout(wc28_1828));
full_adder full_adder28_19(.a(data_A[19] & data_B[28]),.b(w27_2027), .cin(wc28_1828), .s(w28_1928), .cout(wc28_1928));
full_adder full_adder28_20(.a(data_A[20] & data_B[28]),.b(w27_2127), .cin(wc28_1928), .s(w28_2028), .cout(wc28_2028));
full_adder full_adder28_21(.a(data_A[21] & data_B[28]),.b(w27_2227), .cin(wc28_2028), .s(w28_2128), .cout(wc28_2128));
full_adder full_adder28_22(.a(data_A[22] & data_B[28]),.b(w27_2327), .cin(wc28_2128), .s(w28_2228), .cout(wc28_2228));
full_adder full_adder28_23(.a(data_A[23] & data_B[28]),.b(w27_2427), .cin(wc28_2228), .s(w28_2328), .cout(wc28_2328));
full_adder full_adder28_24(.a(data_A[24] & data_B[28]),.b(w27_2527), .cin(wc28_2328), .s(w28_2428), .cout(wc28_2428));
full_adder full_adder28_25(.a(data_A[25] & data_B[28]),.b(w27_2627), .cin(wc28_2428), .s(w28_2528), .cout(wc28_2528));
full_adder full_adder28_26(.a(data_A[26] & data_B[28]),.b(w27_2727), .cin(wc28_2528), .s(w28_2628), .cout(wc28_2628));
full_adder full_adder28_27(.a(data_A[27] & data_B[28]),.b(w27_2827), .cin(wc28_2628), .s(w28_2728), .cout(wc28_2728));
full_adder full_adder28_28(.a(data_A[28] & data_B[28]),.b(w27_2927), .cin(wc28_2728), .s(w28_2828), .cout(wc28_2828));
full_adder full_adder28_29(.a(data_A[29] & data_B[28]),.b(w27_3027), .cin(wc28_2828), .s(w28_2928), .cout(wc28_2928));
full_adder full_adder28_30(.a(data_A[30] & data_B[28]),.b(w27_3127), .cin(wc28_2928), .s(w28_3028), .cout(wc28_3028));
full_adder full_adder28_31(.a(~(data_A[31] & data_B[28])),.b(wc27_3127), .cin(wc28_3028), .s(w28_3128), .cout(wc28_3128));
assign mult_out[28] = w28_028;
half_adder half_adder29_0(.a(data_A[0] & data_B[29]), .b(w28_128), .s(w29_029), .cout(wc29_029));
full_adder full_adder29_1(.a(data_A[1] & data_B[29]),.b(w28_228), .cin(wc29_029), .s(w29_129), .cout(wc29_129));
full_adder full_adder29_2(.a(data_A[2] & data_B[29]),.b(w28_328), .cin(wc29_129), .s(w29_229), .cout(wc29_229));
full_adder full_adder29_3(.a(data_A[3] & data_B[29]),.b(w28_428), .cin(wc29_229), .s(w29_329), .cout(wc29_329));
full_adder full_adder29_4(.a(data_A[4] & data_B[29]),.b(w28_528), .cin(wc29_329), .s(w29_429), .cout(wc29_429));
full_adder full_adder29_5(.a(data_A[5] & data_B[29]),.b(w28_628), .cin(wc29_429), .s(w29_529), .cout(wc29_529));
full_adder full_adder29_6(.a(data_A[6] & data_B[29]),.b(w28_728), .cin(wc29_529), .s(w29_629), .cout(wc29_629));
full_adder full_adder29_7(.a(data_A[7] & data_B[29]),.b(w28_828), .cin(wc29_629), .s(w29_729), .cout(wc29_729));
full_adder full_adder29_8(.a(data_A[8] & data_B[29]),.b(w28_928), .cin(wc29_729), .s(w29_829), .cout(wc29_829));
full_adder full_adder29_9(.a(data_A[9] & data_B[29]),.b(w28_1028), .cin(wc29_829), .s(w29_929), .cout(wc29_929));
full_adder full_adder29_10(.a(data_A[10] & data_B[29]),.b(w28_1128), .cin(wc29_929), .s(w29_1029), .cout(wc29_1029));
full_adder full_adder29_11(.a(data_A[11] & data_B[29]),.b(w28_1228), .cin(wc29_1029), .s(w29_1129), .cout(wc29_1129));
full_adder full_adder29_12(.a(data_A[12] & data_B[29]),.b(w28_1328), .cin(wc29_1129), .s(w29_1229), .cout(wc29_1229));
full_adder full_adder29_13(.a(data_A[13] & data_B[29]),.b(w28_1428), .cin(wc29_1229), .s(w29_1329), .cout(wc29_1329));
full_adder full_adder29_14(.a(data_A[14] & data_B[29]),.b(w28_1528), .cin(wc29_1329), .s(w29_1429), .cout(wc29_1429));
full_adder full_adder29_15(.a(data_A[15] & data_B[29]),.b(w28_1628), .cin(wc29_1429), .s(w29_1529), .cout(wc29_1529));
full_adder full_adder29_16(.a(data_A[16] & data_B[29]),.b(w28_1728), .cin(wc29_1529), .s(w29_1629), .cout(wc29_1629));
full_adder full_adder29_17(.a(data_A[17] & data_B[29]),.b(w28_1828), .cin(wc29_1629), .s(w29_1729), .cout(wc29_1729));
full_adder full_adder29_18(.a(data_A[18] & data_B[29]),.b(w28_1928), .cin(wc29_1729), .s(w29_1829), .cout(wc29_1829));
full_adder full_adder29_19(.a(data_A[19] & data_B[29]),.b(w28_2028), .cin(wc29_1829), .s(w29_1929), .cout(wc29_1929));
full_adder full_adder29_20(.a(data_A[20] & data_B[29]),.b(w28_2128), .cin(wc29_1929), .s(w29_2029), .cout(wc29_2029));
full_adder full_adder29_21(.a(data_A[21] & data_B[29]),.b(w28_2228), .cin(wc29_2029), .s(w29_2129), .cout(wc29_2129));
full_adder full_adder29_22(.a(data_A[22] & data_B[29]),.b(w28_2328), .cin(wc29_2129), .s(w29_2229), .cout(wc29_2229));
full_adder full_adder29_23(.a(data_A[23] & data_B[29]),.b(w28_2428), .cin(wc29_2229), .s(w29_2329), .cout(wc29_2329));
full_adder full_adder29_24(.a(data_A[24] & data_B[29]),.b(w28_2528), .cin(wc29_2329), .s(w29_2429), .cout(wc29_2429));
full_adder full_adder29_25(.a(data_A[25] & data_B[29]),.b(w28_2628), .cin(wc29_2429), .s(w29_2529), .cout(wc29_2529));
full_adder full_adder29_26(.a(data_A[26] & data_B[29]),.b(w28_2728), .cin(wc29_2529), .s(w29_2629), .cout(wc29_2629));
full_adder full_adder29_27(.a(data_A[27] & data_B[29]),.b(w28_2828), .cin(wc29_2629), .s(w29_2729), .cout(wc29_2729));
full_adder full_adder29_28(.a(data_A[28] & data_B[29]),.b(w28_2928), .cin(wc29_2729), .s(w29_2829), .cout(wc29_2829));
full_adder full_adder29_29(.a(data_A[29] & data_B[29]),.b(w28_3028), .cin(wc29_2829), .s(w29_2929), .cout(wc29_2929));
full_adder full_adder29_30(.a(data_A[30] & data_B[29]),.b(w28_3128), .cin(wc29_2929), .s(w29_3029), .cout(wc29_3029));
full_adder full_adder29_31(.a(~(data_A[31] & data_B[29])),.b(wc28_3128), .cin(wc29_3029), .s(w29_3129), .cout(wc29_3129));
assign mult_out[29] = w29_029;
half_adder half_adder30_0(.a(data_A[0] & data_B[30]), .b(w29_129), .s(w30_030), .cout(wc30_030));
full_adder full_adder30_1(.a(data_A[1] & data_B[30]),.b(w29_229), .cin(wc30_030), .s(w30_130), .cout(wc30_130));
full_adder full_adder30_2(.a(data_A[2] & data_B[30]),.b(w29_329), .cin(wc30_130), .s(w30_230), .cout(wc30_230));
full_adder full_adder30_3(.a(data_A[3] & data_B[30]),.b(w29_429), .cin(wc30_230), .s(w30_330), .cout(wc30_330));
full_adder full_adder30_4(.a(data_A[4] & data_B[30]),.b(w29_529), .cin(wc30_330), .s(w30_430), .cout(wc30_430));
full_adder full_adder30_5(.a(data_A[5] & data_B[30]),.b(w29_629), .cin(wc30_430), .s(w30_530), .cout(wc30_530));
full_adder full_adder30_6(.a(data_A[6] & data_B[30]),.b(w29_729), .cin(wc30_530), .s(w30_630), .cout(wc30_630));
full_adder full_adder30_7(.a(data_A[7] & data_B[30]),.b(w29_829), .cin(wc30_630), .s(w30_730), .cout(wc30_730));
full_adder full_adder30_8(.a(data_A[8] & data_B[30]),.b(w29_929), .cin(wc30_730), .s(w30_830), .cout(wc30_830));
full_adder full_adder30_9(.a(data_A[9] & data_B[30]),.b(w29_1029), .cin(wc30_830), .s(w30_930), .cout(wc30_930));
full_adder full_adder30_10(.a(data_A[10] & data_B[30]),.b(w29_1129), .cin(wc30_930), .s(w30_1030), .cout(wc30_1030));
full_adder full_adder30_11(.a(data_A[11] & data_B[30]),.b(w29_1229), .cin(wc30_1030), .s(w30_1130), .cout(wc30_1130));
full_adder full_adder30_12(.a(data_A[12] & data_B[30]),.b(w29_1329), .cin(wc30_1130), .s(w30_1230), .cout(wc30_1230));
full_adder full_adder30_13(.a(data_A[13] & data_B[30]),.b(w29_1429), .cin(wc30_1230), .s(w30_1330), .cout(wc30_1330));
full_adder full_adder30_14(.a(data_A[14] & data_B[30]),.b(w29_1529), .cin(wc30_1330), .s(w30_1430), .cout(wc30_1430));
full_adder full_adder30_15(.a(data_A[15] & data_B[30]),.b(w29_1629), .cin(wc30_1430), .s(w30_1530), .cout(wc30_1530));
full_adder full_adder30_16(.a(data_A[16] & data_B[30]),.b(w29_1729), .cin(wc30_1530), .s(w30_1630), .cout(wc30_1630));
full_adder full_adder30_17(.a(data_A[17] & data_B[30]),.b(w29_1829), .cin(wc30_1630), .s(w30_1730), .cout(wc30_1730));
full_adder full_adder30_18(.a(data_A[18] & data_B[30]),.b(w29_1929), .cin(wc30_1730), .s(w30_1830), .cout(wc30_1830));
full_adder full_adder30_19(.a(data_A[19] & data_B[30]),.b(w29_2029), .cin(wc30_1830), .s(w30_1930), .cout(wc30_1930));
full_adder full_adder30_20(.a(data_A[20] & data_B[30]),.b(w29_2129), .cin(wc30_1930), .s(w30_2030), .cout(wc30_2030));
full_adder full_adder30_21(.a(data_A[21] & data_B[30]),.b(w29_2229), .cin(wc30_2030), .s(w30_2130), .cout(wc30_2130));
full_adder full_adder30_22(.a(data_A[22] & data_B[30]),.b(w29_2329), .cin(wc30_2130), .s(w30_2230), .cout(wc30_2230));
full_adder full_adder30_23(.a(data_A[23] & data_B[30]),.b(w29_2429), .cin(wc30_2230), .s(w30_2330), .cout(wc30_2330));
full_adder full_adder30_24(.a(data_A[24] & data_B[30]),.b(w29_2529), .cin(wc30_2330), .s(w30_2430), .cout(wc30_2430));
full_adder full_adder30_25(.a(data_A[25] & data_B[30]),.b(w29_2629), .cin(wc30_2430), .s(w30_2530), .cout(wc30_2530));
full_adder full_adder30_26(.a(data_A[26] & data_B[30]),.b(w29_2729), .cin(wc30_2530), .s(w30_2630), .cout(wc30_2630));
full_adder full_adder30_27(.a(data_A[27] & data_B[30]),.b(w29_2829), .cin(wc30_2630), .s(w30_2730), .cout(wc30_2730));
full_adder full_adder30_28(.a(data_A[28] & data_B[30]),.b(w29_2929), .cin(wc30_2730), .s(w30_2830), .cout(wc30_2830));
full_adder full_adder30_29(.a(data_A[29] & data_B[30]),.b(w29_3029), .cin(wc30_2830), .s(w30_2930), .cout(wc30_2930));
full_adder full_adder30_30(.a(data_A[30] & data_B[30]),.b(w29_3129), .cin(wc30_2930), .s(w30_3030), .cout(wc30_3030));
full_adder full_adder30_31(.a(~(data_A[31] & data_B[30])),.b(wc29_3129), .cin(wc30_3030), .s(w30_3130), .cout(wc30_3130));
assign mult_out[30] = w30_030;
half_adder half_adder31_0(.a(~(data_A[0] & data_B[31])), .b(w30_130), .s(w31_031), .cout(wc31_031));
full_adder full_adder31_1(.a(~(data_A[1] & data_B[31])),.b(w30_230), .cin(wc31_031), .s(w31_131), .cout(wc31_131));
full_adder full_adder31_2(.a(~(data_A[2] & data_B[31])),.b(w30_330), .cin(wc31_131), .s(w31_231), .cout(wc31_231));
full_adder full_adder31_3(.a(~(data_A[3] & data_B[31])),.b(w30_430), .cin(wc31_231), .s(w31_331), .cout(wc31_331));
full_adder full_adder31_4(.a(~(data_A[4] & data_B[31])),.b(w30_530), .cin(wc31_331), .s(w31_431), .cout(wc31_431));
full_adder full_adder31_5(.a(~(data_A[5] & data_B[31])),.b(w30_630), .cin(wc31_431), .s(w31_531), .cout(wc31_531));
full_adder full_adder31_6(.a(~(data_A[6] & data_B[31])),.b(w30_730), .cin(wc31_531), .s(w31_631), .cout(wc31_631));
full_adder full_adder31_7(.a(~(data_A[7] & data_B[31])),.b(w30_830), .cin(wc31_631), .s(w31_731), .cout(wc31_731));
full_adder full_adder31_8(.a(~(data_A[8] & data_B[31])),.b(w30_930), .cin(wc31_731), .s(w31_831), .cout(wc31_831));
full_adder full_adder31_9(.a(~(data_A[9] & data_B[31])),.b(w30_1030), .cin(wc31_831), .s(w31_931), .cout(wc31_931));
full_adder full_adder31_10(.a(~(data_A[10] & data_B[31])),.b(w30_1130), .cin(wc31_931), .s(w31_1031), .cout(wc31_1031));
full_adder full_adder31_11(.a(~(data_A[11] & data_B[31])),.b(w30_1230), .cin(wc31_1031), .s(w31_1131), .cout(wc31_1131));
full_adder full_adder31_12(.a(~(data_A[12] & data_B[31])),.b(w30_1330), .cin(wc31_1131), .s(w31_1231), .cout(wc31_1231));
full_adder full_adder31_13(.a(~(data_A[13] & data_B[31])),.b(w30_1430), .cin(wc31_1231), .s(w31_1331), .cout(wc31_1331));
full_adder full_adder31_14(.a(~(data_A[14] & data_B[31])),.b(w30_1530), .cin(wc31_1331), .s(w31_1431), .cout(wc31_1431));
full_adder full_adder31_15(.a(~(data_A[15] & data_B[31])),.b(w30_1630), .cin(wc31_1431), .s(w31_1531), .cout(wc31_1531));
full_adder full_adder31_16(.a(~(data_A[16] & data_B[31])),.b(w30_1730), .cin(wc31_1531), .s(w31_1631), .cout(wc31_1631));
full_adder full_adder31_17(.a(~(data_A[17] & data_B[31])),.b(w30_1830), .cin(wc31_1631), .s(w31_1731), .cout(wc31_1731));
full_adder full_adder31_18(.a(~(data_A[18] & data_B[31])),.b(w30_1930), .cin(wc31_1731), .s(w31_1831), .cout(wc31_1831));
full_adder full_adder31_19(.a(~(data_A[19] & data_B[31])),.b(w30_2030), .cin(wc31_1831), .s(w31_1931), .cout(wc31_1931));
full_adder full_adder31_20(.a(~(data_A[20] & data_B[31])),.b(w30_2130), .cin(wc31_1931), .s(w31_2031), .cout(wc31_2031));
full_adder full_adder31_21(.a(~(data_A[21] & data_B[31])),.b(w30_2230), .cin(wc31_2031), .s(w31_2131), .cout(wc31_2131));
full_adder full_adder31_22(.a(~(data_A[22] & data_B[31])),.b(w30_2330), .cin(wc31_2131), .s(w31_2231), .cout(wc31_2231));
full_adder full_adder31_23(.a(~(data_A[23] & data_B[31])),.b(w30_2430), .cin(wc31_2231), .s(w31_2331), .cout(wc31_2331));
full_adder full_adder31_24(.a(~(data_A[24] & data_B[31])),.b(w30_2530), .cin(wc31_2331), .s(w31_2431), .cout(wc31_2431));
full_adder full_adder31_25(.a(~(data_A[25] & data_B[31])),.b(w30_2630), .cin(wc31_2431), .s(w31_2531), .cout(wc31_2531));
full_adder full_adder31_26(.a(~(data_A[26] & data_B[31])),.b(w30_2730), .cin(wc31_2531), .s(w31_2631), .cout(wc31_2631));
full_adder full_adder31_27(.a(~(data_A[27] & data_B[31])),.b(w30_2830), .cin(wc31_2631), .s(w31_2731), .cout(wc31_2731));
full_adder full_adder31_28(.a(~(data_A[28] & data_B[31])),.b(w30_2930), .cin(wc31_2731), .s(w31_2831), .cout(wc31_2831));
full_adder full_adder31_29(.a(~(data_A[29] & data_B[31])),.b(w30_3030), .cin(wc31_2831), .s(w31_2931), .cout(wc31_2931));
full_adder full_adder31_30(.a(~(data_A[30] & data_B[31])),.b(w30_3130), .cin(wc31_2931), .s(w31_3031), .cout(wc31_3031));
full_adder full_adder31_31(.a(data_A[31] & data_B[31]),.b(wc30_3130), .cin(wc31_3031), .s(w31_3131), .cout(wc31_3131));
assign mult_out[31] = w31_031;
assign mult_out[32] = w31_131;
assign mult_out[33] = w31_231;
assign mult_out[34] = w31_331;
assign mult_out[35] = w31_431;
assign mult_out[36] = w31_531;
assign mult_out[37] = w31_631;
assign mult_out[38] = w31_731;
assign mult_out[39] = w31_831;
assign mult_out[40] = w31_931;
assign mult_out[41] = w31_1031;
assign mult_out[42] = w31_1131;
assign mult_out[43] = w31_1231;
assign mult_out[44] = w31_1331;
assign mult_out[45] = w31_1431;
assign mult_out[46] = w31_1531;
assign mult_out[47] = w31_1631;
assign mult_out[48] = w31_1731;
assign mult_out[49] = w31_1831;
assign mult_out[50] = w31_1931;
assign mult_out[51] = w31_2031;
assign mult_out[52] = w31_2131;
assign mult_out[53] = w31_2231;
assign mult_out[54] = w31_2331;
assign mult_out[55] = w31_2431;
assign mult_out[56] = w31_2531;
assign mult_out[57] = w31_2631;
assign mult_out[58] = w31_2731;
assign mult_out[59] = w31_2831;
assign mult_out[60] = w31_2931;
assign mult_out[61] = w31_3031;
assign mult_out[62] = w31_3131;
half_adder half_adderFINAL_0(.a(wc31_3131), .b(1'b1), .s(mult_out[63]), .cout(wcFINAL));

wire all_ones = &mult_out[63:32];  // True if all bits are 1
wire all_zeros = ~(|mult_out[63:32]); // True if all bits are 0
wire sign_A = data_A[31];     // Sign bit of operand A
wire sign_B = data_B[31];     // Sign bit of operand B

wire checkOne, checkZero;
assign checkOne = sign_A & sign_B & mult_out[31];
assign checkZero = ~sign_A & ~sign_B & mult_out[31];

assign data_exception = ((~((mult_out[31] & all_ones) | (~mult_out[63] & all_zeros)))|checkOne|checkZero);


assign data_result[31:0] = mult_out[31:0];

wire[1:0] counter;
TFF_2 TFF_2_1(.clock(clock), .en(1'b1), .clr(ctrl_MULT), .q(counter));
assign data_resultRDY = &counter | data_exception;
endmodule