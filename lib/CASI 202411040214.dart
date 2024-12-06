// import 'dart:core';
//
// import 'dart:io'; // 添加这个导入

// 添加自定义日志函数
// void log(Object? message) {
//   stderr.write('$message\n'); // 或者用 stdout.write('$message\n');
// }

class CAddressBase {
  // 改为 CAddressBase
  CAddressBase() {
    vStructAddressMap = {
      'AddressStart': 0,
      'ByteNode': 0,
      'ValueSwitch': 0,
      'OffsetBit': 0,
    };
  }

  //增加map
  Map<String, int> vStructAddressMap = {
    'AddressStart': 0,
    'ByteNode': 0,
    'ValueSwitch': 0,
    'OffsetBit': 0,
  }; // 空类型

  String vCovStructAddress = ''; // 空类型
  List<int> vdata = []; // 空类型

  String lCovParAddr({
    required int AddressStart, // 可选参数
    required int ByteNode, // 可选参数
    required int ValueSwitch, // 可选参数
    required int OffsetBit, // 可选参数
  }) {
    vStructAddressMap['AddressStart'] = AddressStart;
    vStructAddressMap['ByteNode'] = ByteNode;
    vStructAddressMap['ValueSwitch'] = ValueSwitch;
    vStructAddressMap['OffsetBit'] = OffsetBit;

    int taddress = vStructAddressMap['AddressStart']! +
        (vStructAddressMap['ByteNode']! / 2).floor() +
        (vStructAddressMap['ValueSwitch']!) * 16;

    int tbit = (vStructAddressMap['ByteNode']! * 4 +
            (vStructAddressMap['OffsetBit']!)) %
        8;

    vCovStructAddress = '$taddress.$tbit';
    return vCovStructAddress;
  }

  Map<String, int> lCovAddrPar(String address) {
    List<String> taddresss = address.split('.');
    int taddressStart = int.parse(taddresss[0]);
    int tNumberBit = int.parse(taddresss[1]);

    vStructAddressMap['AddressStart'] = (taddressStart / 100).floor() * 100;

    int tplus1or0 =
        (((tNumberBit + vStructAddressMap['OffsetBit']!) % 8) / 4).floor();

    vStructAddressMap['ByteNode'] = (taddressStart % 100) * 2 % 16 + tplus1or0;

    vStructAddressMap['ValueSwitch'] =
        (taddressStart - vStructAddressMap['AddressStart']!) ~/ 16;

    return vStructAddressMap;
  }
}

var vglobaldataBase = {
  'DFI_CI': {
    'INPUT': [
      {'Name': 'I_DRI_AUT_', 'Comment': 'DRIVE AUTO '},
      {'Name': 'I_DRI_RDY_', 'Comment': 'DRIVE READY '},
      {'Name': 'I_PE1_CHI_', 'Comment': 'CHECK IN INDUCTION HEAD END SENSOR '},
      {'Name': 'I_PE2_CHI_', 'Comment': 'CHECK IN INDUCTION TAIL END SENSOR '}
    ],
    'OUTPUT': [
      {'Name': 'O_MR_FWD_', 'Comment': 'MOTOR RUN FORWARD '},
      {'Name': 'O_MTR_REV_', 'Comment': 'MOTOR RUN REVERSE '},
      {'Name': 'O_DR_LED_', 'Comment': 'DRIVE LED '},
      {'Name': 'O_Q3_', 'Comment': 'Spare '}
    ]
  },
  'DFI1': {
    'INPUT': [
      {'Name': 'I_AUT_', 'Comment': 'Drive Auto '},
      {'Name': 'I_FB_', 'Comment': 'Running Feedback '},
      {'Name': 'I_I6_', 'Comment': 'Spare '},
      {'Name': 'I_I7_', 'Comment': 'Spare '},
    ],
    'OUTPUT': [
      {'Name': 'O_DR_RST_', 'Comment': 'DRIVE RESET '},
      {'Name': 'O_Q5_', 'Comment': 'Spare '},
      {'Name': 'O_Q6_', 'Comment': 'Spare '},
      {'Name': 'O_Q7_', 'Comment': 'Spare '}
    ]
  },
  'DFI2': {
    'INPUT': [
      {'Name': 'I_PE1_', 'Comment': 'Head End Photo-eye '},
      {'Name': 'I_PE2_', 'Comment': 'Tail End Photo-eye '},
      {'Name': 'I_SE_', 'Comment': 'Encoder '},
      {'Name': 'I_I3_', 'Comment': 'Spare '}
    ],
    'OUTPUT': [
      {'Name': 'O_MR_FWD_', 'Comment': 'MOTOR RUN FORWARD '},
      {'Name': 'O_MR_REV_', 'Comment': 'MOTOR RUN REVERSE '},
      {'Name': 'O_DR_LED_', 'Comment': 'Drive LED '},
      {'Name': 'O_Q3_', 'Comment': 'Spare '}
    ]
  },
  'CS_1A': {
    'INPUT': [
      {'Name': 'I_CS_I0_', 'Comment': 'Spare '},
      {'Name': 'I_CS_I1_', 'Comment': 'Spare '},
      {'Name': 'I_CS_RPB_', 'Comment': 'CS Reset Push Button '},
      {'Name': 'I_CS_I2_', 'Comment': 'Spare '}
    ],
    'OUTPUT': [
      {'Name': 'O_CS_Q0_', 'Comment': 'Spare '},
      {'Name': 'O_CS_Q1_', 'Comment': 'Spare '},
      {'Name': 'O_CS_RPL_', 'Comment': 'CS Reset Pilot Lamp '},
      {'Name': 'O_CS_Q2_', 'Comment': 'Spare '}
    ]
  },
  'CS_5A': {
    'INPUT': [
      {'Name': 'I_CS_I0_', 'Comment': 'Spare '},
      {'Name': 'I_CS_I1_', 'Comment': 'Spare '},
      {'Name': 'I_CS_RPB_', 'Comment': 'CS Reset Push Button '},
      {'Name': 'I_CS_ORPB_', 'Comment': 'CS Oversized Reset Push Button '}
    ],
    'OUTPUT': [
      {'Name': 'O_CS_Q0_', 'Comment': 'Spare '},
      {'Name': 'O_CS_Q1_', 'Comment': 'Spare '},
      {'Name': 'O_CS_RPL_', 'Comment': 'CS Reset Pilot Lamp '},
      {'Name': 'O_CS_OSL_', 'Comment': 'Oversized Lamp '}
    ]
  },
  'CS1_7A': {
    'INPUT': [
      {'Name': 'I_CS_CNTR_ON_', 'Comment': 'COUNTER ON 2 WAY KEY SS '},
      {'Name': 'I_CS_SPB_', 'Comment': 'STOP RED PB '},
      {'Name': 'I_CS_RPB_', 'Comment': 'RESET YELLOW PB '},
      {'Name': 'I_CS_OS_RST_', 'Comment': 'OVERSIZE RESET WHITE PB '}
    ],
    'OUTPUT': [
      {'Name': 'O_CS_Q4_', 'Comment': 'Spare '},
      {'Name': 'O_CS_STPL_', 'Comment': 'STOP PB PL(RED) '},
      {'Name': 'O_CS_RPL_', 'Comment': 'RESET PL(YELLOW) '},
      {'Name': 'O_CS_OSL_', 'Comment': 'OVERSIZE RESET PL(WHITE) '}
    ]
  },
  'CS2_7A': {
    'INPUT': [
      {'Name': 'I_CS_FORWARD_', 'Comment': 'BELT FORWARD GREEN PB '},
      {'Name': 'I_CS_REVERSE_', 'Comment': 'BELT REVERSE BLACK PB '},
      {'Name': 'I_CS_RELEASE_', 'Comment': 'BAG RELEASE BLUE PB '},
      {'Name': 'I_CS_OW_', 'Comment': 'OVER WEIGHT INPUT '}
    ],
    'OUTPUT': [
      {'Name': 'O_CS_FWDL_', 'Comment': 'BELT FORWARD PL '},
      {'Name': 'O_CS_Q1_', 'Comment': 'Spare '},
      {'Name': 'O_CS_RELL_', 'Comment': 'BAG RELEASE PL '},
      {'Name': 'O_CS_Q3_', 'Comment': 'Spare '}
    ]
  },
  'CS_17A': {
    'INPUT': [
      {'Name': 'I_CS_TSW_', 'Comment': 'TEST MODE 2-WAY SELECTOR SWITCH '},
      {'Name': 'I_CS_IPB_', 'Comment': 'INSERT BAG BLUE PB '},
      {'Name': 'I_CS_RPB_', 'Comment': 'CS Reset Push Button '},
      {'Name': 'I_CS_ORPB_', 'Comment': 'CS Oversized Reset Push Button '}
    ],
    'OUTPUT': [
      {'Name': 'O_CS_Q4_', 'Comment': 'Spare '},
      {'Name': 'O_CS_RPL_', 'Comment': 'RESET/RESTART PILOT LIGHT (YELLOW) '},
      {'Name': 'O_CS_Q6_', 'Comment': 'Spare '},
      {'Name': 'O_CS_OSL_', 'Comment': 'OVERSIZE RESET PILOT LIGHT (WHITE) '}
    ]
  },
  'CS_18A': {
    'INPUT': [
      {'Name': 'I_CS_I0_', 'Comment': 'Spare '},
      {'Name': 'I_CS_I1_', 'Comment': 'Spare '},
      {'Name': 'I_CS_RPB_', 'Comment': 'RESET/RESTART ILLUMINATED YELLOW PB '},
      {'Name': 'I_CS_REMPB_', 'Comment': 'REMOVE BAG BLACK PB '}
    ],
    'OUTPUT': [
      {'Name': 'O_CS_Q0_', 'Comment': 'Spare '},
      {'Name': 'O_CS_Q1_', 'Comment': 'Spare '},
      {'Name': 'O_CS_RPL_', 'Comment': 'RESET/RESTART PILOT LIGHT (YELLOW) '},
      {'Name': 'O_CS_Q3_', 'Comment': 'Spare '}
    ]
  },
  'DS_1A': {
    'INPUT': [
      {'Name': 'I_DS_I0_', 'Comment': 'Spare '},
      {'Name': 'I_DS_I1_', 'Comment': 'Spare '},
      {'Name': 'I_DS_I2_', 'Comment': 'Spare '},
      {'Name': 'I_DS_I3_', 'Comment': 'Spare '}
    ],
    'OUTPUT': [
      {'Name': 'O_DS_TLA_', 'Comment': 'AMBER STACKLIGHT '},
      {'Name': 'O_DS_TLR_', 'Comment': 'RED STACKLIGHT '},
      {'Name': 'O_DS_BUZ_', 'Comment': 'BUZZER '},
      {'Name': 'O_DS_I4_', 'Comment': 'Spare '}
    ]
  },
  'RBHSD1': {
    'INPUT': [
      {'Name': 'I_HSD_ISO_', 'Comment': 'MAIN ISOLATOR ON '},
      {'Name': 'I_HSD_TOL_A_', 'Comment': 'ARM INVERTER MPCB ON '},
      {'Name': 'I_HSD_TOL_B1_', 'Comment': 'BELT1 MOTOR MPCB ON '},
      {'Name': 'I_HSD_TOL_B2_', 'Comment': 'BELT2 MOTOR MPCB ON '}
    ],
    'OUTPUT': [
      {'Name': 'O_HSD_I0_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I1_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_DS_TLA_', 'Comment': 'DS YELLOW STACKLIGHT '},
      {'Name': 'O_HSD_DS_TLR_', 'Comment': 'DS RED STACKLIGHT '}
    ]
  },
  'RBHSD2': {
    'INPUT': [
      {'Name': 'I_HSD_TOL_CF_', 'Comment': 'MOTOR COOLING FAN MPCB ON '},
      {'Name': 'I_HSD_I5_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_I6_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_STA_BOX_RDY', 'Comment': 'MOTOR STARTER BOX READY '}
    ],
    'OUTPUT': [
      {'Name': 'O_HSD_DS_BUZ_', 'Comment': 'DS BUZZER '},
      {'Name': 'O_HSD_I5_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I6_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I7_', 'Comment': 'SPARE '}
    ]
  },
  'RBHSD3': {
    'INPUT': [
      {'Name': 'I_HSD_RUN_FWD_A_', 'Comment': 'ARM MOTOR RUNNING '},
      {'Name': 'I_HSD_CON_B1_', 'Comment': 'BELT1 CONTACTOR ON '},
      {'Name': 'I_HSD_CON_B2_', 'Comment': 'BELT2 CONTACTOR ON '},
      {
        'Name': 'I_HSD_RUN_FWD_CF_',
        'Comment': 'MOTOR COOLING FAN CONTACTOR ON '
      }
    ],
    'OUTPUT': [
      {'Name': 'O_HSD_CS_HTL', 'Comment': 'SYSTEM HEALTHY PILOT LIGHT '},
      {'Name': 'O_HSD_CS_MOL_', 'Comment': 'MOTOR OVERLOAD PILOT LIGHT '},
      {'Name': 'O_HSD_CS_RPL_', 'Comment': 'RPB FAULT RESET PILOT LIGHT '},
      {'Name': 'O_HSD_I1_3_', 'Comment': 'SPARE '}
    ]
  },
  'RBHSD4': {
    'INPUT': [
      {'Name': 'I_HSD_RDY_', 'Comment': 'ARM INVERTER HEALTHY '},
      {'Name': 'I_HSD_EXT_', 'Comment': 'HSD EXTEND POSITION SENSOR '},
      {'Name': 'I_HSD_RET_', 'Comment': 'HSD RETRACT POSITION SENSOR '},
      {'Name': 'I_HSD_I1_7_', 'Comment': 'SPARE '}
    ],
    'OUTPUT': [
      {'Name': 'O_HSD_I1_4_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I1_5_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I1_6_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I1_7_', 'Comment': 'SPARE '}
    ]
  },
  'RBHSD5': {
    'INPUT': [
      {'Name': 'I_HSD_CS_AUT_', 'Comment': 'MANUAL MODE KSW '},
      {'Name': 'I_HSD_CS_KSW_', 'Comment': 'CYCLE KSW '},
      {'Name': 'I_HSD_CS_RPB_', 'Comment': 'RPB FAULT RESET/RESTART '},
      {'Name': 'I_HSD_RUN_FWD_B_', 'Comment': 'BELT RUN '}
    ],
    'OUTPUT': [
      {'Name': 'O_HSD_MR_A_', 'Comment': 'ARM MOTOR RUN '},
      {'Name': 'O_HSD_MR_B1_', 'Comment': 'BELT1 MOTOR RUN '},
      {'Name': 'O_HSD_MR_B2_', 'Comment': 'BELT2 MOTOR RUN '},
      {'Name': 'O_HSD_RST_', 'Comment': 'INVERTER RESET '}
    ]
  },
  'RBHSD6': {
    'INPUT': [
      {'Name': 'I_HSD_I2_4_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_I2_5_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_I2_6_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_I2_7_', 'Comment': 'SPARE '}
    ],
    'OUTPUT': [
      {'Name': 'O_HSD_I2_4_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I2_5_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I2_6_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I2_7_', 'Comment': 'SPARE '}
    ]
  },
  'RBHSD7': {
    'INPUT': [
      {'Name': 'I_HSD_I3_0_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_I3_1_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_I3_2_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_I3_3_', 'Comment': 'SPARE '}
    ],
    'OUTPUT': [
      {'Name': 'O_HSD_MR_0_', 'Comment': 'MOTOR COOLING FAN RUN '},
      {'Name': 'O_HSD_I3_1_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I3_2_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I3_3_', 'Comment': 'SPARE '}
    ]
  },
  'RBHSD8': {
    'INPUT': [
      {'Name': 'I_HSD_I3_4_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_I3_5_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_I3_6_', 'Comment': 'SPARE '},
      {'Name': 'I_HSD_I3_7_', 'Comment': 'SPARE '}
    ],
    'OUTPUT': [
      {'Name': 'O_HSD_I3_4_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I3_5_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I3_6_', 'Comment': 'SPARE '},
      {'Name': 'O_HSD_I3_7_', 'Comment': 'SPARE '}
    ]
  },
  'RBSFD1': {
    'INPUT': [
      {'Name': 'I_SPD_STAT_RDY_SFD_', 'Comment': 'MOTOR STARTER READY '},
      {'Name': 'I_SPD_ARM_MTR_OVL_SFD_', 'Comment': 'ARM BELT MOTOR OVERLOAD '},
      {'Name': 'I_SPD_SW_MTR_OVL_SFD_', 'Comment': 'SWING MOTOR OVERLOAD '},
      {'Name': 'I_SPD_I7_', 'Comment': ' '}
    ],
    'OUTPUT': [
      {'Name': 'O_SPD_MRB_', 'Comment': 'ARM BELT MOTOR RUN '},
      {'Name': 'O_SPD_MRA_', 'Comment': 'SWING MOTOR RUN '},
      {'Name': 'O_SPD_O6_', 'Comment': 'SPARE '},
      {'Name': 'O_SPD_O7_', 'Comment': 'SPARE '}
    ]
  },
  'RBSFD2': {
    'INPUT': [
      {'Name': 'I_SPD_KSW_MAN_', 'Comment': 'MANUAL MODE KSW '},
      {'Name': 'I_SPD_KSW_', 'Comment': 'CYCLE KSW '},
      {'Name': 'I_SPD_RPB_', 'Comment': 'FAULT RESET /RESTART PBL '},
      {'Name': 'I_SPD_JBPB_', 'Comment': 'BELT RUN PB'}
    ],
    'OUTPUT': [
      {'Name': 'O_SPD_CS_HTL_', 'Comment': 'SYSTEM HEALTHY '},
      {'Name': 'O_SPD_CS_MOL_', 'Comment': 'MOTOR OVERLOAD '},
      {'Name': 'O_SPD_O2_', 'Comment': 'SPARE '},
      {'Name': 'O_SPD_CS_RPL_', 'Comment': 'FAULT RESET / RESTART '}
    ]
  },
  'RBSFD3': {
    'INPUT': [
      {'Name': 'I_SPD_CON_B_', 'Comment': 'ARM BELT MOTOR CONTACTOR ON '},
      {'Name': 'I_SPD_CON_A_', 'Comment': 'SWING MOTOR CONTACTOR ON '},
      {'Name': 'I_SPD_RET_', 'Comment': 'SFD EXTEND POSITION SENSOR '},
      {'Name': 'I_SPD_EXT_', 'Comment': 'SFD RETRACT POSITION SENSOR '}
    ],
    'OUTPUT': [
      {'Name': 'O_SPD_O1_4_', 'Comment': 'SPARE '},
      {'Name': 'O_SPD_O1_5_', 'Comment': 'SPARE '},
      {'Name': 'O_SPD_O1_6_', 'Comment': 'SPARE '},
      {'Name': 'O_SPD_O1_7_', 'Comment': 'SPARE '}
    ]
  },
  'RBFSD1': {
    'INPUT': [
      {'Name': 'I_FSD_MTR_STR_RDY_', 'Comment': 'MOTOR STARTER BOX READY '},
      {'Name': 'I_FSD_MAN_KSW_', 'Comment': 'MANUAL MODE KSW '},
      {'Name': 'I_FSD_OPN_PB_', 'Comment': 'OPEN PUSH BUTTON '},
      {'Name': 'I_FSD_CLS_PB_', 'Comment': 'CLOSE PUSH BUTTON '}
    ],
    'OUTPUT': [
      {'Name': 'O_FSD_DR_OPN_', 'Comment': 'FSD DOOR OPEN '},
      {'Name': 'O_FSD_DR_CLS_', 'Comment': 'FSD DOOR CLOSE '},
      {'Name': 'O_FSD_DR_STP_', 'Comment': 'FSD DOOR STOP '},
      {'Name': 'O_FSD_Q7_', 'Comment': 'SPARE '},
    ]
  },
  'RBFSD2': {
    'INPUT': [
      {'Name': 'I_FSD_F_', 'Comment': 'DOOR INSTRUCTION SYSTEM '},
      {'Name': 'I_FSD_UP_', 'Comment': 'DOOR OPEN POSITION SENSOR '},
      {'Name': 'I_FSD_DN_', 'Comment': 'DOOR CLOSE SENSOR '},
      {'Name': 'I_FSD_I3_', 'Comment': 'SPARE '}
    ],
    'OUTPUT': [
      {'Name': 'O_FSD_BRK_EN_', 'Comment': 'BRAKE RELESE ENABLE '},
      {'Name': 'O_FSD_Q1_', 'Comment': 'SPARE '},
      {
        'Name': 'O_FSD_SYS_HEL_WPL_',
        'Comment': 'SYSTEM HEALTHY WHITE PILOT LIGHT '
      },
      {'Name': 'O_FSD_Q3_', 'Comment': 'SPARE '}
    ]
  },
};

var vglobaldataNodeHSD = {
  0: 'RBHSD1_TA01_01',
  1: 'RBHSD2_TA01_01',
  2: 'RBHSD3_TA01_01',
  3: 'RBHSD4_TA01_01',
  4: 'RBHSD5_TA01_01',
  5: 'RBHSD6_TA01_01',
  6: 'RBHSD7_TA01_01',
  7: '',
  8: '',
  9: '',
  10: '',
  11: '',
  12: '',
  13: '',
  14: '',
  15: '',
  16: '',
  17: '',
  18: '',
  19: '',
  20: '',
  21: '',
  22: '',
  23: '',
  24: '',
  25: '',
  26: '',
  27: '',
  28: '',
  29: '',
  30: '',
  31: ''
};

var vglobaldataNodePLC17_ASI702A = {
  0: "",
  1: "",
  2: "DFI_CI68_01",
  3: "DFI_CI68_02",
  4: "DFI_CI69_01",
  5: "DFI_CI69_02",
  6: "DFI_CI70_01",
  7: "DFI_CI70_02",
  8: "DFI_CI71_01",
  9: "DFI_CI71_02",
  10: "DFI_CI72_01",
  11: "DFI_CI72_02",
  12: "DFI_CI73_01",
  13: "DFI_CI73_02",
  14: "DFI_CI74_01",
  15: "DFI_CI74_02",
  16: "DFI_CI75_01",
  17: "DFI_CI75_02",
  18: "DFI1_TA01_02",
  19: "DFI2_TA01_02",
  20: "DFI1_TA01_03",
  21: "DFI2_TA01_03",
  22: "DFI1_TA01_04",
  23: "DFI2_TA01_04",
  24: "DFI1_TA01_05",
  25: "DFI2_TA01_05",
  26: "DFI1_TA01_06",
  27: "DFI2_TA01_06",
  28: "",
  29: "",
  30: "",
  31: ""
};
var vglobaldataNodePLC17_ASI702B = {
  0: '',
  1: '',
  2: 'CS1_CI68_01_7A',
  3: 'CS2_CI68_01_7A',
  4: 'CS1_CI69_01_7A',
  5: 'CS2_CI69_01_7A',
  6: 'CS1_CI70_01_7A',
  7: 'CS2_CI70_01_7A',
  8: 'CS1_CI71_01_7A',
  9: 'CS2_CI71_01_7A',
  10: 'CS1_CI72_01_7A',
  11: 'CS2_CI72_01_7A',
  12: 'CS1_CI73_01_7A',
  13: 'CS2_CI73_01_7A',
  14: 'CS1_CI74_01_7A',
  15: 'CS2_CI74_01_7A',
  16: 'CS1_CI75_01_7A',
  17: 'CS2_CI75_01_7A',
  18: 'CS_TA01_03_5A',
  19: 'CS_TA01_06_17A',
  20: '',
  21: '',
  22: '',
  23: '',
  24: 'RBFSD1_TA01_05_FSD',
  25: 'RBFSD2_TA01_05_FSD',
  26: '',
  27: '',
  28: '',
  29: '',
  30: '',
  31: ''
};
var vglobaldataNodePLC17_ASI703A = {
  0: '',
  1: '',
  2: 'DFI1_TA01_07',
  3: 'DFI2_TA01_07',
  4: 'DFI1_TA01_08',
  5: 'DFI2_TA01_08',
  6: 'DFI1_TA01_09',
  7: 'DFI2_TA01_09',
  8: 'DFI1_TA01_10',
  9: 'DFI2_TA01_10',
  10: 'DFI1_TA01_11',
  11: 'DFI2_TA01_11',
  12: 'DFI1_CL01_01',
  13: 'DFI2_CL01_01',
  14: 'DFI1_SB01_01',
  15: 'DFI2_SB01_01',
  16: 'DFI1_CL01_02',
  17: 'DFI2_CL01_02',
  18: 'DFI1_CL01_03',
  19: 'DFI2_CL01_03',
  20: 'DFI1_CL01_04',
  21: 'DFI2_CL01_04',
  22: 'DFI1_CL01_05',
  23: 'DFI2_CL01_05',
  24: 'DFI1_CL01_06',
  25: 'DFI2_CL01_06',
  26: 'DFI1_MF02_01',
  27: 'DFI2_MF02_01',
  28: 'DFI1_MF02_02',
  29: 'DFI2_MF02_02',
  30: '',
  31: '',
};
var vglobaldataNodePLC17_ASI703B = {
  0: '',
  1: '',
  2: 'CS_TA01_07_18A',
  3: 'CS_TA01_11_1A',
  4: 'CS_SB01_01_1A',
  5: 'DS_SB01_01_1A',
  6: 'CS_CL01_06_1A',
  7: 'CS_MF02_02_1A',
  8: 'DS_CL01_03_1A',
  9: '',
  10: '',
  11: '',
  12: '',
  13: '',
  14: '',
  15: '',
  16: '',
  17: '',
  18: '',
  19: '',
  20: '',
  21: '',
  22: '',
  23: '',
  24: 'RBSFD1_MF02_SFD',
  25: 'RBSFD2_MF02_SFD',
  26: 'RBSFD3_MF02_SFD',
  27: '',
  28: '',
  29: '',
  30: '',
  31: '',
};

var vglobalRegExp = [
  {
    //'CS1_CI68_01_7A' => {'key': 'CS1_7A', 'value': 'CI68_01_7A'}
    'RegExp': r'^([A-Z]+\d*)(_)([A-Z]+\d+_[\dA-Z]+)(_)(\d+[A-Z])$',
    'keys': [1, 2, 5],
    'values': [3, 5],
  },
  {
    //'DFI_CI72_01' => {'key': 'DFI_CI', 'value': 'CI72_01'}
    'RegExp': r'^([A-Z]+\d*)(_)(CI)(\d+_[\dA-Z]+)$',
    'keys': [1, 2, 3],
    'values': [3, 4],
  },
  {
    //'DFI1_TA01_07' => {'key': 'DFI1', 'value': 'TA01_07'}
    'RegExp': r'^([A-Z]+\d*)(_)([A-Z]+\d+_[\dA-Z]+)$',
    'keys': [1],
    'values': [3],
  },
  {
    //'RBFSD1_TA01_05_FSD' => {'key': 'RBFSD1', 'value': 'TA01_05_FSD'}
    'RegExp': r'^([A-Z]+\d*)(_)([A-Z]+\d+_[\dA-Z]+)(_)([A-Z]+)',
    'keys': [1],
    'values': [3, 4, 5],
  },
];

Map<String, String> lRegExpKeyValue({
  Map<String, dynamic> vMapegExp = const {},
  String sName = 'CS1_CI68_01_7A',
}) {
  RegExp exp = RegExp(vMapegExp['RegExp']!);
  Match? match = exp.firstMatch(sName);

  try {
    if (match != null) {
      String skey = '';
      String svalue = '';
      List<int> keys = vMapegExp['keys'];
      List<int> values = vMapegExp['values'];
      for (int i = 0; i < keys.length; i++) {
        skey += match.group(keys[i]) ?? '';
      }
      for (int i = 0; i < values.length; i++) {
        svalue += match.group(values[i]) ?? '';
      }
      return {'key': skey, 'value': svalue};
    }
  } catch (e) {
    print(e);
  }
  return {'key': '', 'value': ''};
}

List<List<String>> lgenerateTableEntries(
    CAddressBase addressBase,
    int tAddressStart,
    int tByteNode,
    int tValueSwitch,
    int tOffsetBit,
    Map<String, dynamic> dataType,
    String skey,
    String svalue) {
  List<String> tTableInputs = [];
  List<String> tTableOutputs = [];

  if (skey == '' || svalue == '') {
    return [tTableInputs, tTableOutputs];
  }
  var input = dataType[skey]?['INPUT'] ?? [];
  var output = dataType[skey]?['OUTPUT'] ?? [];

  if (input.isEmpty || output.isEmpty) {
    return [tTableInputs, tTableOutputs];
  }

  for (int iOffsetBit = 0; iOffsetBit < 4; iOffsetBit++) {
    String tCovStructAddress = addressBase.lCovParAddr(
      AddressStart: tAddressStart,
      ByteNode: tByteNode,
      ValueSwitch: tValueSwitch,
      OffsetBit: tOffsetBit + iOffsetBit,
    );
    String tInputName = "";
    if (input.isNotEmpty &&
        iOffsetBit < input.length &&
        input[iOffsetBit]['Name'] != null) {
      tInputName = input[iOffsetBit]['Name']!;
    }
    String tInputComment = "";
    if (input.isNotEmpty &&
        iOffsetBit < input.length &&
        input[iOffsetBit]['Comment'] != null) {
      tInputComment = input[iOffsetBit]['Comment']!;
    }
    String tOutputName = "";
    if (output.isNotEmpty &&
        iOffsetBit < output.length &&
        output[iOffsetBit]['Name'] != null) {
      tOutputName = output[iOffsetBit]['Name']!;
    }
    String tOutputComment = "";
    if (output.isNotEmpty &&
        iOffsetBit < output.length &&
        output[iOffsetBit]['Comment'] != null) {
      tOutputComment = output[iOffsetBit]['Comment']!;
    }

    if (tInputName != "" && svalue != "") {
      String tTableInput =
          '$tInputName$svalue\tBool\tI$tCovStructAddress\tFalse\tTrue\tTrue\tTrue\t\t$tInputComment$svalue';

      tTableInputs.add(tTableInput);
    }

    if (tOutputName != "" && svalue != "") {
      String tTableOutput =
          '$tOutputName$svalue\tBool\tQ$tCovStructAddress\tFalse\tTrue\tTrue\tTrue\t\t$tOutputComment$svalue';

      tTableOutputs.add(tTableOutput);
    }
  }
  return [tTableInputs, tTableOutputs];
}

void main() {
  print('hello world');
  CAddressBase addressBase = CAddressBase();
  int tAddressStart = 1200;
  int tByteNode = 0;
  int tValueSwitch = 1;
  int tOffsetBit = 4;

//vMapegExps separateKeyValue dataNodePLC17_ASI703B
  var tdataValueName = [];
  for (var entry in vglobaldataNodePLC17_ASI702A.entries) {
    for (var exp in vglobalRegExp) {
      var result = lRegExpKeyValue(
          vMapegExp: exp, sName: entry.value.toString().replaceAll('-', '_'));
      if (result['key'] != '' || entry.value.toString() == '') {
        tdataValueName.add({
          'Key': result['key'].toString(),
          'Value': result['value'].toString(),
        });
        break;
      }
    }
  }

  for (var entry in tdataValueName) {
    var result = lgenerateTableEntries(
        addressBase,
        tAddressStart,
        tByteNode,
        tValueSwitch,
        tOffsetBit,
        vglobaldataBase,
        entry['Key'],
        entry['Value']);
    var tTableInputs = result[0];
    var tTableOutputs = result[1];

    // Print inputs
    for (String input in tTableInputs) {
      print(input);
    }
    // Print outputs
    for (String output in tTableOutputs) {
      print(output);
    }
    tByteNode += 1;
  }

  print('');
}
