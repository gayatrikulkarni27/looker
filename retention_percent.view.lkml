view: retention_percent {
  derived_table: {
    sql: select DATE(START_DATE_EOMONTH) AS "MONTH",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 0 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R00",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 1 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R01",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 2 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R02",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 3 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R03",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 4 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R04",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 5 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R05",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 6 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R06",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 7 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R07",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 8 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R08",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 9 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R09",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 10 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R10",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 11 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R11",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 12 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R12",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 13 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R13",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 14 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R14",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 15 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R15",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 16 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R16",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 17 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R17",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 18 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R18",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 19 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R19",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 20 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R20",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 21 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R21",
          CONCAT(CAST(COUNT(DISTINCT case when MONTHS_RETAINED >= 22 then (PATIENT_NAME) else null end)/COUNT(DISTINCT PATIENT_NAME)*100 as INT),'%') AS "R22"
          FROM "CYMETRIX"."PROCESSED_APPOINTMENTS" WHERE
          DATE(START_DATE_EOMONTH) > '2018-10-31'
          AND OPIOID_PATIENT_ = 'yes'
          AND date(START_DATE)<=(CURRENT_DATE()-30*MONTHS_RETAINED)
          GROUP BY 1
          ORDER BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: month {
    type: date
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: r0 {
    type: string
    sql: ${TABLE}."R0" ;;
  }

  dimension: r1 {
    type: string
    sql: ${TABLE}."R1" ;;
  }

  dimension: r2 {
    type: string
    sql: ${TABLE}."R2" ;;
  }

  dimension: r3 {
    type: string
    sql: ${TABLE}."R3" ;;
  }

  dimension: r4 {
    type: string
    sql: ${TABLE}."R4" ;;
  }

  dimension: r5 {
    type: string
    sql: ${TABLE}."R5" ;;
  }

  dimension: r6 {
    type: string
    sql: ${TABLE}."R6" ;;
  }

  dimension: r7 {
    type: string
    sql: ${TABLE}."R7" ;;
  }

  dimension: r8 {
    type: string
    sql: ${TABLE}."R8" ;;
  }

  dimension: r9 {
    type: string
    sql: ${TABLE}."R9" ;;
  }

  dimension: r10 {
    type: string
    sql: ${TABLE}."R10" ;;
  }

  dimension: r11 {
    type: string
    sql: ${TABLE}."R11" ;;
  }

  dimension: r12 {
    type: string
    sql: ${TABLE}."R12" ;;
  }

  dimension: r13 {
    type: string
    sql: ${TABLE}."R13" ;;
  }

  dimension: r14 {
    type: string
    sql: ${TABLE}."R14" ;;
  }

  dimension: r15 {
    type: string
    sql: ${TABLE}."R15" ;;
  }

  dimension: r16 {
    type: string
    sql: ${TABLE}."R16" ;;
  }

  dimension: r17 {
    type: string
    sql: ${TABLE}."R17" ;;
  }

  dimension: r18 {
    type: string
    sql: ${TABLE}."R18" ;;
  }

  dimension: r19 {
    type: string
    sql: ${TABLE}."R19" ;;
  }

  dimension: r20 {
    type: string
    sql: ${TABLE}."R20" ;;
  }

  dimension: r21 {
    type: string
    sql: ${TABLE}."R21" ;;
  }

  dimension: r22 {
    type: string
    sql: ${TABLE}."R22" ;;
  }

  set: detail {
    fields: [
      month,
      r0,
      r1,
      r2,
      r3,
      r4,
      r5,
      r6,
      r7,
      r8,
      r9,
      r10,
      r11,
      r12,
      r13,
      r14,
      r15,
      r16,
      r17,
      r18,
      r19,
      r20,
      r21,
      r22
    ]
  }
}
