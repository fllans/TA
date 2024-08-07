PROGRAM TMB_1_6_AOC4



(***************************************************************************)
// НАСТРОЙКА ФБ
(***************************************************************************)

TMB_1_0_AOC4_CH0_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AOC4_CH0_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AOC4_CH0_VAL_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AOC4_CH0_VAL_QUALITY_AD.IN100 := AD_IN100;

TMB_1_0_AOC4_CH0_VAL_DIAG_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AOC4_CH0_VAL_DIAG_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AOC4_CH0_VAL_DIAG_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AOC4_CH0_VAL_DIAG_QUALITY_AD.IN100 := AD_IN100;

TMB_1_0_AOC4_CH1_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AOC4_CH1_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AOC4_CH1_VAL_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AOC4_CH1_VAL_QUALITY_AD.IN100 := AD_IN100;

TMB_1_0_AOC4_CH1_VAL_DIAG_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AOC4_CH1_VAL_DIAG_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AOC4_CH1_VAL_DIAG_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AOC4_CH1_VAL_DIAG_QUALITY_AD.IN100 := AD_IN100;

TMB_1_0_AOC4_CH2_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AOC4_CH2_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AOC4_CH2_VAL_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AOC4_CH2_VAL_QUALITY_AD.IN100 := AD_IN100;

TMB_1_0_AOC4_CH2_VAL_DIAG_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AOC4_CH2_VAL_DIAG_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AOC4_CH2_VAL_DIAG_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AOC4_CH2_VAL_DIAG_QUALITY_AD.IN100 := AD_IN100;

TMB_1_0_AOC4_CH3_VAL_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AOC4_CH3_VAL_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AOC4_CH3_VAL_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AOC4_CH3_VAL_QUALITY_AD.IN100 := AD_IN100;

TMB_1_0_AOC4_CH3_VAL_DIAG_QUALITY_AD.Valid_down := AD_VALID_DOWN;
TMB_1_0_AOC4_CH3_VAL_DIAG_QUALITY_AD.Valid_up := AD_VALID_UP;
TMB_1_0_AOC4_CH3_VAL_DIAG_QUALITY_AD.IN0 := AD_IN0;
TMB_1_0_AOC4_CH3_VAL_DIAG_QUALITY_AD.IN100 := AD_IN100;


(***************************************************************************)
// ЗАПИСЬ ЗНАЧЕНИЙ В КАНАЛЫ
(***************************************************************************)

_IO_Q32_AOC4_01_0_VAL.Measurement := ANY_TO_INT(REAL_TO_DINT(ABS(GENERATOR.Out_REAL), 0.0, 1500.0));
_IO_Q32_AOC4_01_1_VAL.Measurement := ANY_TO_INT(REAL_TO_DINT(ABS(GENERATOR.Out_REAL), 0.0, 1500.0));
_IO_Q32_AOC4_01_2_VAL.Measurement := ANY_TO_INT(REAL_TO_DINT(ABS(GENERATOR.Out_REAL), 0.0, 1500.0));
_IO_Q32_AOC4_01_3_VAL.Measurement := ANY_TO_INT(REAL_TO_DINT(ABS(GENERATOR.Out_REAL), 0.0, 1500.0));

(***************************************************************************)
// СБРОС ОШИБОК
(***************************************************************************)

IF TMB_1_0_AOC4_KVIT
    THEN TMB_1_0_AOC4_KVIT := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 0
(***************************************************************************)

TMB_1_0_AOC4_CH0_VAL_MEASUREMENT := _IO_Q32_AOC4_01_0_VAL.Measurement;
TMB_1_0_AOC4_CH0_VAL_DIAG_MEASUREMENT := _IO_I32_AOC4_01_0_VAL_DIAG.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality))
    THEN TMB_1_0_AOC4_CH0_VAL_DIAG_QUALITY_FAULT := TRUE;
    ELSE TMB_1_0_AOC4_CH0_VAL_DIAG_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I32_AOC4_01_0_VAL_DIAG.Quality = 0
    THEN TMB_1_0_AOC4_CH0_VAL_DIAG_QUALITY_ERROR := TRUE;
    ELSE TMB_1_0_AOC4_CH0_VAL_DIAG_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 1
(***************************************************************************)

TMB_1_0_AOC4_CH1_VAL_MEASUREMENT := _IO_Q32_AOC4_01_1_VAL.Measurement;
TMB_1_0_AOC4_CH1_VAL_DIAG_MEASUREMENT := _IO_I32_AOC4_01_1_VAL_DIAG.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality))
    THEN TMB_1_0_AOC4_CH1_VAL_DIAG_QUALITY_FAULT := TRUE;
    ELSE TMB_1_0_AOC4_CH1_VAL_DIAG_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I32_AOC4_01_1_VAL_DIAG.Quality = 0
    THEN TMB_1_0_AOC4_CH1_VAL_DIAG_QUALITY_ERROR := TRUE;
    ELSE TMB_1_0_AOC4_CH1_VAL_DIAG_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 2
(***************************************************************************)

TMB_1_0_AOC4_CH2_VAL_MEASUREMENT := _IO_Q32_AOC4_01_2_VAL.Measurement;
TMB_1_0_AOC4_CH2_VAL_DIAG_MEASUREMENT := _IO_I32_AOC4_01_2_VAL_DIAG.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality))
    THEN TMB_1_0_AOC4_CH2_VAL_DIAG_QUALITY_FAULT := TRUE;
    ELSE TMB_1_0_AOC4_CH2_VAL_DIAG_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I32_AOC4_01_2_VAL_DIAG.Quality = 0
    THEN TMB_1_0_AOC4_CH2_VAL_DIAG_QUALITY_ERROR := TRUE;
    ELSE TMB_1_0_AOC4_CH2_VAL_DIAG_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// КАНАЛ 3
(***************************************************************************)

TMB_1_0_AOC4_CH3_VAL_MEASUREMENT := _IO_Q32_AOC4_01_3_VAL.Measurement;
TMB_1_0_AOC4_CH3_VAL_DIAG_MEASUREMENT := _IO_I32_AOC4_01_3_VAL_DIAG.Measurement;

//Отказ сигнала
IF INT14(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality))
    THEN TMB_1_0_AOC4_CH3_VAL_DIAG_QUALITY_FAULT := TRUE;
    ELSE TMB_1_0_AOC4_CH3_VAL_DIAG_QUALITY_FAULT := FALSE;
END_IF;

// Проверка на ошибку
IF _IO_I32_AOC4_01_3_VAL_DIAG.Quality = 0
    THEN TMB_1_0_AOC4_CH3_VAL_DIAG_QUALITY_ERROR := TRUE;
    ELSE TMB_1_0_AOC4_CH3_VAL_DIAG_QUALITY_ERROR := FALSE;
END_IF;


(***************************************************************************)
// ИНТЕГРАЛЬНЫЕ ПОКАЗАТЕЛИ
(***************************************************************************)

// Интегральный показатель VAL.Quality
IF NOT INT0(TMB_1_0_AOC4_CH0_VAL_QUALITY) AND
    NOT INT0(TMB_1_0_AOC4_CH1_VAL_QUALITY) AND
    NOT INT0(TMB_1_0_AOC4_CH2_VAL_QUALITY) AND
    NOT INT0(TMB_1_0_AOC4_CH3_VAL_QUALITY)
    
    THEN TMB_1_0_AOC4_INTEGRAL_VAL_QUALITY := TRUE;
    ELSE TMB_1_0_AOC4_INTEGRAL_VAL_QUALITY := FALSE;
END_IF;

// Интегральный показатель VAL_DIAG.Quality
IF NOT INT0(TMB_1_0_AOC4_CH0_VAL_DIAG_QUALITY) AND
    NOT INT0(TMB_1_0_AOC4_CH1_VAL_DIAG_QUALITY) AND
    NOT INT0(TMB_1_0_AOC4_CH2_VAL_DIAG_QUALITY) AND
    NOT INT0(TMB_1_0_AOC4_CH3_VAL_DIAG_QUALITY)
    
    THEN TMB_1_0_AOC4_INTEGRAL_VAL_DIAG_QUALITY := TRUE;
    ELSE TMB_1_0_AOC4_INTEGRAL_VAL_DIAG_QUALITY := FALSE;
END_IF;


(***************************************************************************)
// ДИАГНОСТИКА ШИНЫ
(***************************************************************************)

// VAL.Quality
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality))

    THEN TMB_1_0_AOC4_TMB_VAL_QUALITY := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality))

    THEN TMB_1_0_AOC4_TMB_VAL_QUALITY := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality))

    THEN TMB_1_0_AOC4_TMB_VAL_QUALITY := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_0_VAL.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_1_VAL.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_2_VAL.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    INT5(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_Q32_AOC4_01_3_VAL.Quality))

    THEN TMB_1_0_AOC4_TMB_VAL_QUALITY := 3;
END_IF;

// VAL_DIAG.Quality
// Адресное пространство не было найдено в Ubusdb
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality))

    THEN TMB_1_0_AOC4_TMB_VAL_DIAG_QUALITY := 0;
END_IF;

// Не сошлась контрольная сумма данных
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    NOT INT5(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality))

    THEN TMB_1_0_AOC4_TMB_VAL_DIAG_QUALITY := 1;
END_IF;

// Не выставлены биты достоверности элементов в АП
IF
    // Канал 0
    NOT INT4(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND

    // Канал 1
    NOT INT4(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND

    // Канал 2
    NOT INT4(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND

    // Канал 3
    NOT INT4(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality))

    THEN TMB_1_0_AOC4_TMB_VAL_DIAG_QUALITY := 2;
END_IF;

// Полученные данные корректны
IF
    // Канал 0
    INT4(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_0_VAL_DIAG.Quality)) AND

    // Канал 1
    INT4(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_1_VAL_DIAG.Quality)) AND

    // Канал 2
    INT4(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_2_VAL_DIAG.Quality)) AND

    // Канал 3
    INT4(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    INT5(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    NOT INT6(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality)) AND
    NOT INT7(ANY_TO_DINT(_IO_I32_AOC4_01_3_VAL_DIAG.Quality))

    THEN TMB_1_0_AOC4_TMB_VAL_DIAG_QUALITY := 3;
END_IF;


END_PROGRAM