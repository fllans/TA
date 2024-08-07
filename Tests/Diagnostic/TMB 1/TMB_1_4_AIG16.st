PROGRAM TMB_1_4_AIG16


(***************************************************************************)
// НАСТРОЙКА ФБ
(***************************************************************************)

TMB_1_0_AIG16_CH0_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AIG16_CH0_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AIG16_CH0_VAL_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AIG16_CH0_VAL_QUALITY_AD.IN100 := AD_IN100;

TMB_1_0_AIG16_CH4_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AIG16_CH4_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AIG16_CH4_VAL_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AIG16_CH4_VAL_QUALITY_AD.IN100 := AD_IN100;

TMB_1_0_AIG16_CH8_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AIG16_CH8_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AIG16_CH8_VAL_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AIG16_CH8_VAL_QUALITY_AD.IN100 := AD_IN100;

TMB_1_0_AIG16_CH12_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AIG16_CH12_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AIG16_CH12_VAL_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AIG16_CH12_VAL_QUALITY_AD.IN100 := AD_IN100;


(***************************************************************************)
// СБРОС ОШИБОК
(***************************************************************************)

IF TMB_1_0_AIG16_KVIT
    THEN TMB_1_0_AIG16_KVIT := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 0
(***************************************************************************)

TMB_1_0_AIG16_CH0_VAL_MEASUREMENT := _IO_I31_AIG16_01_0_VAL.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality))
    THEN TMB_1_0_AIG16_CH0_VAL_QUALITY_FAULT := TRUE;
    ELSE TMB_1_0_AIG16_CH0_VAL_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I31_AIG16_01_0_VAL.Quality = 0
    THEN TMB_1_0_AIG16_CH0_VAL_QUALITY_ERROR := TRUE;
    ELSE TMB_1_0_AIG16_CH0_VAL_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 4
(***************************************************************************)

TMB_1_0_AIG16_CH4_VAL_MEASUREMENT := _IO_I31_AIG16_01_4_VAL.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality))
    THEN TMB_1_0_AIG16_CH4_VAL_QUALITY_FAULT := TRUE;
    ELSE TMB_1_0_AIG16_CH4_VAL_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I31_AIG16_01_4_VAL.Quality = 0
    THEN TMB_1_0_AIG16_CH4_VAL_QUALITY_ERROR := TRUE;
    ELSE TMB_1_0_AIG16_CH4_VAL_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 8
(***************************************************************************)

TMB_1_0_AIG16_CH8_VAL_MEASUREMENT := _IO_I31_AIG16_01_8_VAL.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I31_AIG16_01_8_VAL.Quality))
    THEN TMB_1_0_AIG16_CH8_VAL_QUALITY_FAULT := TRUE;
    ELSE TMB_1_0_AIG16_CH8_VAL_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I31_AIG16_01_8_VAL.Quality = 0
    THEN TMB_1_0_AIG16_CH8_VAL_QUALITY_ERROR := TRUE;
    ELSE TMB_1_0_AIG16_CH8_VAL_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 12
(***************************************************************************)

TMB_1_0_AIG16_CH12_VAL_MEASUREMENT := _IO_I31_AIG16_01_12_VAL.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality))
    THEN TMB_1_0_AIG16_CH12_VAL_QUALITY_FAULT := TRUE;
    ELSE TMB_1_0_AIG16_CH12_VAL_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I31_AIG16_01_12_VAL.Quality = 0
    THEN TMB_1_0_AIG16_CH12_VAL_QUALITY_ERROR := TRUE;
    ELSE TMB_1_0_AIG16_CH12_VAL_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// ИНТЕГРАЛЬНЫЕ ПОКАЗАТЕЛИ
(***************************************************************************)

// Интегральный показатель VAL.Quality
IF NOT INT0(TMB_1_0_AIG16_CH0_VAL_QUALITY) AND
    NOT INT0(TMB_1_0_AIG16_CH4_VAL_QUALITY) AND
    NOT INT0(TMB_1_0_AIG16_CH8_VAL_QUALITY) AND
    NOT INT0(TMB_1_0_AIG16_CH12_VAL_QUALITY)
    
    THEN TMB_1_0_AIG16_INTEGRAL_VAL_QUALITY := TRUE;
    ELSE TMB_1_0_AIG16_INTEGRAL_VAL_QUALITY := FALSE;
END_IF;


(***************************************************************************)
// ДИАГНОСТИКА ШИНЫ
(***************************************************************************)

// Диагностика 1 группы
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_1 := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_1 := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_1 := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_0_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_1_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_2_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_3_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_1 := 3;
END_IF;

// Диагностика 2 группы
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 4
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND

    // Канал 5
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND

    // Канал 6
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND

    // Канал 7
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_2 := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 4
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND

    // Канал 5
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND

    // Канал 6
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND

    // Канал 7
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_2 := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 4
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND

    // Канал 5
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND

    // Канал 6
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND

    // Канал 7
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_2 := 2;
END_IF;

// Полученные данные корректны
IF 
    // Канал 4
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND

    // Канал 5
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND

    // Канал 6
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND

    // Канал 7
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_2 := 3;
END_IF;

// Диагностика 3 группы
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 8
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND

    // Канал 9
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND

    // Канал 10
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND

    // Канал 11
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_3 := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 8
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND

    // Канал 9
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND

    // Канал 10
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND

    // Канал 11
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_3 := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 8
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND

    // Канал 9
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND

    // Канал 10
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND

    // Канал 11
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_3 := 2;
END_IF;

// Полученные данные корректны
IF 
    // Канал 8
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_4_VAL.Quality)) AND

    // Канал 9
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_5_VAL.Quality)) AND

    // Канал 10
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_6_VAL.Quality)) AND

    // Канал 11
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_7_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_3 := 3;
END_IF;

// Диагностика 4 группы
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 12
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND

    // Канал 13
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND

    // Канал 14
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND

    // Канал 15
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_4 := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 12
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND

    // Канал 13
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND

    // Канал 14
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND

    // Канал 15
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_4 := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 12
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND

    // Канал 13
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND

    // Канал 14
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND

    // Канал 15
    NOT INT4(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_4 := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 12
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_12_VAL.Quality)) AND

    // Канал 13
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_13_VAL.Quality)) AND

    // Канал 14
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_14_VAL.Quality)) AND

    // Канал 15
    INT4(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I31_AIG16_01_15_VAL.Quality))

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_4 := 3;
END_IF;


(***************************************************************************)
// ОБЩИЙ ИНТЕГРАЛЬНЫЙ ПОАЗАТЕЛЬ
(***************************************************************************)

// Адресное пространство не было найдено в Ubusdb
IF TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_1 = 0 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_2 = 0 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_3 = 0 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_4 = 0

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_1 = 1 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_2 = 1 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_3 = 1 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_4 = 1

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_1 = 2 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_2 = 2 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_3 = 2 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_4 = 2

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY := 2;
END_IF;

// Полученные данные корректны
IF TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_1 = 3 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_2 = 3 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_3 = 3 AND
    TMB_1_0_AIG16_UNITBUS_VAL_QUALITY_GROUP_4 = 3

    THEN TMB_1_0_AIG16_UNITBUS_VAL_QUALITY := 3;
END_IF;


END_PROGRAM