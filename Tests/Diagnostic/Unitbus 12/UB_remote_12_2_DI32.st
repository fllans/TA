PROGRAM UB_remote_12_2_DI32


(***************************************************************************)
// СБРОС ОШИБОК
(***************************************************************************)

IF UB_12_0_DI32_KVIT
    THEN UB_12_0_DI32_KVIT := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 0
(***************************************************************************)

// VAL
UB_12_0_DI32_CH0_VAL_MEASUREMENT := _IO_I6_DI32_0_VAL.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality))
    THEN UB_12_0_DI32_CH0_VAL_QUALITY_FAULT := TRUE;
    ELSE UB_12_0_DI32_CH0_VAL_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I6_DI32_0_VAL.Quality = 0
    THEN UB_12_0_DI32_CH0_VAL_QUALITY_ERROR := TRUE;
    ELSE UB_12_0_DI32_CH0_VAL_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 8
(***************************************************************************)

// VAL
UB_12_0_DI32_CH8_VAL_MEASUREMENT := _IO_I6_DI32_8_VAL.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality))
    THEN UB_12_0_DI32_CH8_VAL_QUALITY_FAULT := TRUE;
    ELSE UB_12_0_DI32_CH8_VAL_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I6_DI32_8_VAL.Quality = 0
    THEN UB_12_0_DI32_CH8_VAL_QUALITY_ERROR := TRUE;
    ELSE UB_12_0_DI32_CH8_VAL_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 16
(***************************************************************************)

// VAL
UB_12_0_DI32_CH16_VAL_MEASUREMENT := _IO_I6_DI32_16_VAL.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality))
    THEN UB_12_0_DI32_CH16_VAL_QUALITY_FAULT := TRUE;
    ELSE UB_12_0_DI32_CH16_VAL_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I6_DI32_16_VAL.Quality = 0
    THEN UB_12_0_DI32_CH16_VAL_QUALITY_ERROR := TRUE;
    ELSE UB_12_0_DI32_CH16_VAL_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 24
(***************************************************************************)

// VAL
UB_12_0_DI32_CH24_VAL_MEASUREMENT := _IO_I6_DI32_24_VAL.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality))
    THEN UB_12_0_DI32_CH24_VAL_QUALITY_FAULT := TRUE;
    ELSE UB_12_0_DI32_CH24_VAL_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I6_DI32_24_VAL.Quality = 0
    THEN UB_12_0_DI32_CH24_VAL_QUALITY_ERROR := TRUE;
    ELSE UB_12_0_DI32_CH24_VAL_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// ИНТЕГРАЛЬНЫЕ ПОКАЗАТЕЛИ
(***************************************************************************)

// Интегральный показателшь VAL.Quality
IF NOT INT0(UB_12_0_DI32_CH0_VAL_QUALITY) AND
    NOT INT0(UB_12_0_DI32_CH8_VAL_QUALITY) AND
    NOT INT0(UB_12_0_DI32_CH16_VAL_QUALITY) AND
    NOT INT0(UB_12_0_DI32_CH24_VAL_QUALITY)
    
    THEN UB_12_0_DI32_INTEGRAL_VAL_QUALITY := TRUE;
    ELSE UB_12_0_DI32_INTEGRAL_VAL_QUALITY := FALSE;
END_IF;


(***************************************************************************)
// ДИАГНОСТИКА ШИНЫ
(***************************************************************************)

// VAL
// Диагностика 1 группы
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND

    // Канал 4
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND

    // Канал 5
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND

    // Канал 6
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND

    // Канал 7
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND

    // Канал 4
    INT4(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND

    // Канал 5
    INT4(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND

    // Канал 6
    INT4(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND

    // Канал 7
    INT4(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND

    // Канал 4
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND

    // Канал 5
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND

    // Канал 6
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND

    // Канал 7
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_0_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_1_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_2_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_3_VAL.Quality)) AND

    // Канал 4
    INT4(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_4_VAL.Quality)) AND

    // Канал 5
    INT4(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_5_VAL.Quality)) AND

    // Канал 6
    INT4(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND

    // Канал 7
    INT4(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_7_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 := 3;
END_IF;

// Диагностика 2 группы
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 8
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND

    // Канал 9
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND

    // Канал 10
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND

    // Канал 11
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND

    // Канал 12
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND

    // Канал 13
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND

    // Канал 14
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND

    // Канал 15
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_2 := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 8
    INT4(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND

    // Канал 9
    INT4(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND

    // Канал 10
    INT4(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND

    // Канал 11
    INT4(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND

    // Канал 12
    INT4(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND

    // Канал 13
    INT4(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND

    // Канал 14
    INT4(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND

    // Канал 15
    INT4(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 8
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND

    // Канал 9
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND

    // Канал 10
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND

    // Канал 11
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND

    // Канал 12
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND

    // Канал 13
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND

    // Канал 14
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND

    // Канал 15
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 8
    INT4(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_8_VAL.Quality)) AND

    // Канал 9
    INT4(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_9_VAL.Quality)) AND

    // Канал 10
    INT4(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_10_VAL.Quality)) AND

    // Канал 11
    INT4(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_11_VAL.Quality)) AND

    // Канал 12
    INT4(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_12_VAL.Quality)) AND

    // Канал 13
    INT4(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_13_VAL.Quality)) AND

    // Канал 14
    INT4(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_14_VAL.Quality)) AND

    // Канал 15
    INT4(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_15_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 := 3;
END_IF;

// Диагностика 3 группы
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND

    // Канал 4
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND

    // Канал 5
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND

    // Канал 6
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND

    // Канал 7
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_3 := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    
    // Канал 4
    INT4(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND

    // Канал 5
    INT4(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND

    // Канал 6
    INT4(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND

    // Канал 7
    INT4(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_3 := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND

    // Канал 4
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND

    // Канал 5
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND

    // Канал 6
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND

    // Канал 7
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_3 := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_16_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_17_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_18_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_19_VAL.Quality)) AND

    // Канал 4
    INT4(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_20_VAL.Quality)) AND

    // Канал 5
    INT4(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_21_VAL.Quality)) AND

    // Канал 6
    INT4(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_22_VAL.Quality)) AND

    // Канал 7
    INT4(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_23_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_3 := 3;
END_IF;


// Диагностика 4 группы
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND

    // Канал 4
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND

    // Канал 5
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND

    // Канал 6
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND

    // Канал 7
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_4 := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND

    // Канал 4
    INT4(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND

    // Канал 5
    INT4(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND

    // Канал 6
    INT4(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND

    // Канал 7
    INT4(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_4 := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND

    // Канал 4
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND

    // Канал 5
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND

    // Канал 6
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND

    // Канал 7
    NOT INT4(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_4 := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_24_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_25_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_26_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_27_VAL.Quality)) AND

    // Канал 4
    INT4(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_28_VAL.Quality)) AND

    // Канал 5
    INT4(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_29_VAL.Quality)) AND

    // Канал 6
    INT4(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_30_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_6_VAL.Quality)) AND

    // Канал 7
    INT4(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I6_DI32_31_VAL.Quality))
    
    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_4 := 3;
END_IF;


(***************************************************************************)
// ОБЩИЙ ИНТЕГРАЛЬНЫЙ ПОАЗАТЕЛЬ
(***************************************************************************)

// Адресное пространство не было найдено в Ubusdb
IF UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 = 0 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_2 = 0 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_3 = 0 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_4 = 0

    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 = 1 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_2 = 1 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_3 = 1 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_4 = 1

    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 = 2 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_2 = 2 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_3 = 2 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_4 = 2

    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY := 2;
END_IF;

// Полученные данные корректны
IF UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_1 = 3 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_2 = 3 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_3 = 3 AND
    UB_12_0_DI32_UNITBUS_VAL_QUALITY_GROUP_4 = 3

    THEN UB_12_0_DI32_UNITBUS_VAL_QUALITY := 3;
END_IF;


END_PROGRAM