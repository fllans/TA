PROGRAM UB_local_0_5_AI8


(***************************************************************************)
// НАСТРОЙКА ФБ
(***************************************************************************)

UB_0_0_AI8_CH0_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
UB_0_0_AI8_CH0_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
UB_0_0_AI8_CH0_VAL_QUALITY_AD.IN0 := AD_IN0;
UB_0_0_AI8_CH0_VAL_QUALITY_AD.IN100 := AD_IN100;

UB_0_0_AI8_CH4_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
UB_0_0_AI8_CH4_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
UB_0_0_AI8_CH4_VAL_QUALITY_AD.IN0 := AD_IN0;
UB_0_0_AI8_CH4_VAL_QUALITY_AD.IN100 := AD_IN100;


(***************************************************************************)
// СБРОС ОШИБОК
(***************************************************************************)

IF UB_0_0_AI8_KVIT
    THEN UB_0_0_AI8_KVIT := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 0
(***************************************************************************)

UB_0_0_AI8_CH0_VAL_MEASUREMENT := _IO_I3_AI8_0_VAL.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality))
    THEN UB_0_0_AI8_CH0_VAL_QUALITY_FAULT := TRUE;
    ELSE UB_0_0_AI8_CH0_VAL_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I3_AI8_0_VAL.Quality = 0
    THEN UB_0_0_AI8_CH0_VAL_QUALITY_ERROR := TRUE;
    ELSE UB_0_0_AI8_CH0_VAL_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 4
(***************************************************************************)

UB_0_0_AI8_CH4_VAL_MEASUREMENT := _IO_I3_AI8_4_VAL.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality))
    THEN UB_0_0_AI8_CH4_VAL_QUALITY_FAULT := TRUE;
    ELSE UB_0_0_AI8_CH4_VAL_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I3_AI8_4_VAL.Quality = 0
    THEN UB_0_0_AI8_CH4_VAL_QUALITY_ERROR := TRUE;
    ELSE UB_0_0_AI8_CH4_VAL_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// ИНТЕГРАЛЬНЫЕ ПОКАЗАТЕЛИ
(***************************************************************************)

// Интегральный показателшь VAL.Quality
IF NOT INT0(UB_0_0_AI8_CH0_VAL_QUALITY) AND
    NOT INT0(UB_0_0_AI8_CH4_VAL_QUALITY)
    
    THEN UB_0_0_AI8_INTEGRAL_VAL_QUALITY := TRUE;
    ELSE UB_0_0_AI8_INTEGRAL_VAL_QUALITY := FALSE;
END_IF;


(***************************************************************************)
// ДИАГНОСТИКА ШИНЫ
(***************************************************************************)

// Диагностика 1 группы
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality))

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_1 := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality))

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_1 := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality))

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_1 := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_0_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_1_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_2_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_3_VAL.Quality))

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_1 := 3;
END_IF;

// Диагностика 2 группы
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 4
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND

    // Канал 5
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND

    // Канал 6
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND

    // Канал 7
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality))

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_2 := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 4
    INT4(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND

    // Канал 5
    INT4(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND

    // Канал 6
    INT4(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND

    // Канал 7
    INT4(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality))

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_2 := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 4
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND

    // Канал 5
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND

    // Канал 6
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND

    // Канал 7
    NOT INT4(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality))

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_2 := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 4
    INT4(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_4_VAL.Quality)) AND

    // Канал 5
    INT4(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_5_VAL.Quality)) AND

    // Канал 6
    INT4(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_6_VAL.Quality)) AND

    // Канал 7
    INT4(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I3_AI8_7_VAL.Quality))

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_2 := 3;
END_IF;


(***************************************************************************)
// ОБЩИЙ ИНТЕГРАЛЬНЫЙ ПОАЗАТЕЛЬ
(***************************************************************************)

// Адресное пространство не было найдено в Ubusdb
IF UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_1 = 0 AND
    UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_2 = 0

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_1 = 1 AND
    UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_2 = 1

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_1 = 2 AND
    UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_2 = 2

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY := 2;
END_IF;

// Полученные данные корректны
IF UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_1 = 3 AND
    UB_0_0_AI8_UNITBUS_VAL_QUALITY_GROUP_2 = 3

    THEN UB_0_0_AI8_UNITBUS_VAL_QUALITY := 3;
END_IF;


END_PROGRAM