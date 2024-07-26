PROGRAM UB_local_0_6_AOC4



(***************************************************************************)
// НАСТРОЙКА ФБ
(***************************************************************************)

UB_0_0_AOC4_CH0_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
UB_0_0_AOC4_CH0_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
UB_0_0_AOC4_CH0_VAL_QUALITY_AD.IN0 := AD_IN0;
UB_0_0_AOC4_CH0_VAL_QUALITY_AD.IN100 := AD_IN100;

UB_0_0_AOC4_CH0_VAL_DIAG_QUALITY_AD.Valid_down := AD_VALID_DOWN;
UB_0_0_AOC4_CH0_VAL_DIAG_QUALITY_AD.Valid_up := AD_VALID_UP;
UB_0_0_AOC4_CH0_VAL_DIAG_QUALITY_AD.IN0 := AD_IN0;
UB_0_0_AOC4_CH0_VAL_DIAG_QUALITY_AD.IN100 := AD_IN100;

UB_0_0_AOC4_CH1_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
UB_0_0_AOC4_CH1_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
UB_0_0_AOC4_CH1_VAL_QUALITY_AD.IN0 := AD_IN0;
UB_0_0_AOC4_CH1_VAL_QUALITY_AD.IN100 := AD_IN100;

UB_0_0_AOC4_CH1_VAL_DIAG_QUALITY_AD.Valid_down := AD_VALID_DOWN;
UB_0_0_AOC4_CH1_VAL_DIAG_QUALITY_AD.Valid_up := AD_VALID_UP;
UB_0_0_AOC4_CH1_VAL_DIAG_QUALITY_AD.IN0 := AD_IN0;
UB_0_0_AOC4_CH1_VAL_DIAG_QUALITY_AD.IN100 := AD_IN100;

UB_0_0_AOC4_CH2_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
UB_0_0_AOC4_CH2_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
UB_0_0_AOC4_CH2_VAL_QUALITY_AD.IN0 := AD_IN0;
UB_0_0_AOC4_CH2_VAL_QUALITY_AD.IN100 := AD_IN100;

UB_0_0_AOC4_CH2_VAL_DIAG_QUALITY_AD.Valid_down := AD_VALID_DOWN;
UB_0_0_AOC4_CH2_VAL_DIAG_QUALITY_AD.Valid_up := AD_VALID_UP;
UB_0_0_AOC4_CH2_VAL_DIAG_QUALITY_AD.IN0 := AD_IN0;
UB_0_0_AOC4_CH2_VAL_DIAG_QUALITY_AD.IN100 := AD_IN100;

UB_0_0_AOC4_CH3_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
UB_0_0_AOC4_CH3_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
UB_0_0_AOC4_CH3_VAL_QUALITY_AD.IN0 := AD_IN0;
UB_0_0_AOC4_CH3_VAL_QUALITY_AD.IN100 := AD_IN100;

UB_0_0_AOC4_CH3_VAL_DIAG_QUALITY_AD.Valid_down := AD_VALID_DOWN;
UB_0_0_AOC4_CH3_VAL_DIAG_QUALITY_AD.Valid_up := AD_VALID_UP;
UB_0_0_AOC4_CH3_VAL_DIAG_QUALITY_AD.IN0 := AD_IN0;
UB_0_0_AOC4_CH3_VAL_DIAG_QUALITY_AD.IN100 := AD_IN100;


(***************************************************************************)
// ЗАПИСЬ ЗНАЧЕНИЙ В КАНАЛЫ
(***************************************************************************)

_IO_Q4_AOC4_0_VAL.Measurement := ANY_TO_INT(REAL_TO_DINT(ABS(GENERATOR.Out_REAL), 0.0, 1500.0));
_IO_Q4_AOC4_1_VAL.Measurement := ANY_TO_INT(REAL_TO_DINT(ABS(GENERATOR.Out_REAL), 0.0, 1500.0));
_IO_Q4_AOC4_2_VAL.Measurement := ANY_TO_INT(REAL_TO_DINT(ABS(GENERATOR.Out_REAL), 0.0, 1500.0));
_IO_Q4_AOC4_3_VAL.Measurement := ANY_TO_INT(REAL_TO_DINT(ABS(GENERATOR.Out_REAL), 0.0, 1500.0));


(***************************************************************************)
// СБРОС ОШИБОК
(***************************************************************************)

IF UB_0_0_AOC4_KVIT
    THEN UB_0_0_AOC4_KVIT := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 0
(***************************************************************************)

UB_0_0_AOC4_CH0_VAL_MEASUREMENT := _IO_Q4_AOC4_0_VAL.Measurement;
UB_0_0_AOC4_CH0_VAL_DIAG_MEASUREMENT := _IO_I4_AOC4_0_VAL_DIAG.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality))
    THEN UB_0_0_AOC4_CH0_VAL_DIAG_QUALITY_FAULT := TRUE;
    ELSE UB_0_0_AOC4_CH0_VAL_DIAG_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I4_AOC4_0_VAL_DIAG.Quality = 0
    THEN UB_0_0_AOC4_CH0_VAL_DIAG_QUALITY_ERROR := TRUE;
    ELSE UB_0_0_AOC4_CH0_VAL_DIAG_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 1
(***************************************************************************)

UB_0_0_AOC4_CH1_VAL_MEASUREMENT := _IO_Q4_AOC4_1_VAL.Measurement;
UB_0_0_AOC4_CH1_VAL_DIAG_MEASUREMENT := _IO_I4_AOC4_1_VAL_DIAG.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality))
    THEN UB_0_0_AOC4_CH1_VAL_DIAG_QUALITY_FAULT := TRUE;
    ELSE UB_0_0_AOC4_CH1_VAL_DIAG_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I4_AOC4_1_VAL_DIAG.Quality = 0
    THEN UB_0_0_AOC4_CH1_VAL_DIAG_QUALITY_ERROR := TRUE;
    ELSE UB_0_0_AOC4_CH1_VAL_DIAG_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 2
(***************************************************************************)

UB_0_0_AOC4_CH2_VAL_MEASUREMENT := _IO_Q4_AOC4_2_VAL.Measurement;
UB_0_0_AOC4_CH2_VAL_DIAG_MEASUREMENT := _IO_I4_AOC4_2_VAL_DIAG.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality))
    THEN UB_0_0_AOC4_CH2_VAL_DIAG_QUALITY_FAULT := TRUE;
    ELSE UB_0_0_AOC4_CH2_VAL_DIAG_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I4_AOC4_2_VAL_DIAG.Quality = 0
    THEN UB_0_0_AOC4_CH2_VAL_DIAG_QUALITY_ERROR := TRUE;
    ELSE UB_0_0_AOC4_CH2_VAL_DIAG_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 3
(***************************************************************************)

UB_0_0_AOC4_CH3_VAL_MEASUREMENT := _IO_Q4_AOC4_3_VAL.Measurement;
UB_0_0_AOC4_CH3_VAL_DIAG_MEASUREMENT := _IO_I4_AOC4_3_VAL_DIAG.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality))
    THEN UB_0_0_AOC4_CH3_VAL_DIAG_QUALITY_FAULT := TRUE;
    ELSE UB_0_0_AOC4_CH3_VAL_DIAG_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I4_AOC4_3_VAL_DIAG.Quality = 0
    THEN UB_0_0_AOC4_CH3_VAL_DIAG_QUALITY_ERROR := TRUE;
    ELSE UB_0_0_AOC4_CH3_VAL_DIAG_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// ИНТЕГРАЛЬНЫЕ ПОКАЗАТЕЛИ
(***************************************************************************)

// Интегральный показателшь VAL.Quality
IF NOT INT0(UB_0_0_AOC4_CH0_VAL_QUALITY) AND
    NOT INT0(UB_0_0_AOC4_CH1_VAL_QUALITY) AND
    NOT INT0(UB_0_0_AOC4_CH2_VAL_QUALITY) AND
    NOT INT0(UB_0_0_AOC4_CH3_VAL_QUALITY)
    
    THEN UB_0_0_AOC4_INTEGRAL_VAL_QUALITY := TRUE;
    ELSE UB_0_0_AOC4_INTEGRAL_VAL_QUALITY := FALSE;
END_IF;

// Интегральный показателшь VAL_DIAG.Quality
IF NOT INT0(UB_0_0_AOC4_CH0_VAL_DIAG_QUALITY) AND
    NOT INT0(UB_0_0_AOC4_CH1_VAL_DIAG_QUALITY) AND
    NOT INT0(UB_0_0_AOC4_CH2_VAL_DIAG_QUALITY) AND
    NOT INT0(UB_0_0_AOC4_CH3_VAL_DIAG_QUALITY)
    
    THEN UB_0_0_AOC4_INTEGRAL_VAL_DIAG_QUALITY := TRUE;
    ELSE UB_0_0_AOC4_INTEGRAL_VAL_DIAG_QUALITY := FALSE;
END_IF;


(***************************************************************************)
// ДИАГНОСТИКА ШИНЫ
(***************************************************************************)

// VAL.Quality
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality))

    THEN UB_0_0_AOC4_UNITBUS_VAL_QUALITY := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality))

    THEN UB_0_0_AOC4_UNITBUS_VAL_QUALITY := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality))

    THEN UB_0_0_AOC4_UNITBUS_VAL_QUALITY := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_0_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_1_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_2_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q4_AOC4_3_VAL.Quality))

    THEN UB_0_0_AOC4_UNITBUS_VAL_QUALITY := 3;
END_IF;

// VAL_DIAG.Quality
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality))

    THEN UB_0_0_AOC4_UNITBUS_VAL_DIAG_QUALITY := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality))

    THEN UB_0_0_AOC4_UNITBUS_VAL_DIAG_QUALITY := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality))

    THEN UB_0_0_AOC4_UNITBUS_VAL_DIAG_QUALITY := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_0_VAL_DIAG.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_1_VAL_DIAG.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_2_VAL_DIAG.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I4_AOC4_3_VAL_DIAG.Quality))

    THEN UB_0_0_AOC4_UNITBUS_VAL_DIAG_QUALITY := 3;
END_IF;


END_PROGRAM