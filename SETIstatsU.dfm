object MainForm: TMainForm
  Left = 192
  Top = 107
  AlphaBlendValue = 220
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 
    'SETI@home Statistics --- (c)2002 by Markus Birth <mbirth@webwrit' +
    'ers.de>'
  ClientHeight = 625
  ClientWidth = 786
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 389
    Height = 47
    Caption = 'SETI@home Statistics'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -42
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Transparent = True
    OnClick = Label1Click
  end
  object Label5: TLabel
    Left = 410
    Top = 36
    Width = 67
    Height = 13
    Caption = 'Client Version:'
  end
  object Label10: TLabel
    Left = 307
    Top = 60
    Width = 70
    Height = 13
    Caption = 'SETI-directory:'
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 352
    Width = 769
    Height = 265
    ActivePage = SkyMapSheet
    HotTrack = True
    TabOrder = 5
    TabPosition = tpBottom
    object AnalSheet: TTabSheet
      Hint = 'Shows information about the current state of processing.'
      Caption = 'Analysis state'
      object cliru: TLabel
        Left = 8
        Top = 8
        Width = 185
        Height = 41
        Hint = 'Shows whether the client is running or not.'
        Alignment = taCenter
        AutoSize = False
        Caption = 'Client NOT running'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label9: TLabel
        Left = 28
        Top = 68
        Width = 47
        Height = 13
        Caption = 'CPU time:'
      end
      object Mark25: TLabel
        Left = 720
        Top = 172
        Width = 39
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = '25%'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        Layout = tlCenter
      end
      object Mark100: TLabel
        Left = 720
        Top = 27
        Width = 39
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = '100%'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        Layout = tlCenter
      end
      object Mark50: TLabel
        Left = 720
        Top = 123
        Width = 39
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = '50%'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        Layout = tlCenter
      end
      object Mark75: TLabel
        Left = 720
        Top = 75
        Width = 39
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = '75%'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        Layout = tlCenter
      end
      object Label11: TLabel
        Left = 312
        Top = 28
        Width = 83
        Height = 13
        Caption = 'Doppler shift rate:'
      end
      object Label12: TLabel
        Left = 342
        Top = 53
        Width = 54
        Height = 13
        Caption = 'FFT length:'
      end
      object Label14: TLabel
        Left = 8
        Top = 96
        Width = 3
        Height = 13
      end
      object Label15: TLabel
        Left = 11
        Top = 91
        Width = 65
        Height = 13
        Caption = 'Time since dl:'
      end
      object prog2: TProgressBar
        Left = 696
        Top = 16
        Width = 17
        Height = 201
        Max = 10000
        Orientation = pbVertical
        TabOrder = 0
      end
      object ccputime: TEdit
        Left = 80
        Top = 64
        Width = 113
        Height = 21
        Hint = 'cpu [state.sah]'
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
        Text = 'ccputime'
      end
      object ShiftRate: TEdit
        Left = 400
        Top = 24
        Width = 73
        Height = 21
        Hint = 'cr [state.sah]'
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
        Text = 'ShiftRate'
      end
      object FFTlen: TEdit
        Left = 400
        Top = 48
        Width = 73
        Height = 21
        Hint = 'fl [state.sah]'
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
        Text = 'FFTlen'
      end
      object TimeGone: TEdit
        Left = 80
        Top = 88
        Width = 113
        Height = 21
        Hint = 'Time since the download of current WU'
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
        Text = 'TimeGone'
      end
      object AnalButton: TButton
        Left = 200
        Top = 32
        Width = 75
        Height = 17
        Caption = '##ERR##'
        TabOrder = 5
        OnClick = AnalButtonClick
      end
      object PID: TEdit
        Left = 200
        Top = 8
        Width = 73
        Height = 21
        Hint = 'Process ID of the SETI-client'
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
        Text = 'PID'
      end
    end
    object MultiWUSheet: TTabSheet
      Hint = 
        'Shows information about the current state of the Multi-WU-proces' +
        'sing.'
      Caption = 'MuWU (Multi-WU) state'
      ImageIndex = 1
    end
    object SkyMapSheet: TTabSheet
      Caption = 'Skymap'
      ImageIndex = 3
      object SkyMapButton: TButton
        Left = 8
        Top = 192
        Width = 745
        Height = 41
        Hint = 'Opens the skymap-window'
        Caption = 'Show Skymap'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
        OnClick = SkyMapButtonClick
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 8
        Width = 169
        Height = 113
        Caption = 'Show'
        TabOrder = 1
        object CuWU: TCheckBox
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Hint = 'Displays current workunit position'
          Caption = 'Current WU'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CuWUClick
        end
        object CWUwhat: TRadioButton
          Left = 32
          Top = 32
          Width = 113
          Height = 17
          Hint = 
            'Displays a green circle (or a yellow cross) at the starting posi' +
            'tion of the current workunit'
          Caption = 'Start position only'
          TabOrder = 1
          OnClick = CWUwhatClick
        end
        object CWUwhat2: TRadioButton
          Left = 32
          Top = 48
          Width = 129
          Height = 17
          Hint = 
            'Displays a green circle (or cross) at the starting position and ' +
            'a red circle (or cross) at the ending position of the current wo' +
            'rkunit'
          Caption = 'Start and end position'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = CWUwhatClick
        end
        object CWUwhat3: TRadioButton
          Left = 32
          Top = 64
          Width = 113
          Height = 17
          Hint = 
            'Displays a yellow line going through all positions of the curren' +
            't workunit'
          Caption = 'Complete track'
          TabOrder = 3
          OnClick = CWUwhatClick
        end
        object Crosses: TCheckBox
          Left = 8
          Top = 88
          Width = 129
          Height = 17
          Hint = 
            'Draws full-size crosses instead of circles for "start position o' +
            'nly" and "start and end position"'
          Caption = 'Crosses instead circles'
          TabOrder = 4
        end
      end
      object GroupBox5: TGroupBox
        Left = 184
        Top = 8
        Width = 185
        Height = 89
        Caption = 'Also show'
        TabOrder = 2
        object HistWU: TCheckBox
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Hint = 'Displays the positions of recently analyzed workunits'
          Caption = 'History entries'
          TabOrder = 0
          OnClick = HistWUClick
        end
        object HistShow1: TRadioButton
          Left = 32
          Top = 32
          Width = 113
          Height = 17
          Caption = 'Start positions only'
          TabOrder = 1
        end
        object HistShow2: TRadioButton
          Left = 32
          Top = 48
          Width = 129
          Height = 17
          Caption = 'Start and end positions'
          TabOrder = 2
        end
        object HistShow3: TRadioButton
          Left = 32
          Top = 64
          Width = 113
          Height = 17
          Caption = 'Complete Tracks'
          Checked = True
          TabOrder = 3
          TabStop = True
        end
      end
    end
    object PrefsSheet: TTabSheet
      Hint = 'Lets you edit the preferences.'
      Caption = 'Preferences'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      object Label16: TLabel
        Left = 8
        Top = 8
        Width = 61
        Height = 13
        Caption = 'Refresh rate:'
      end
      object Label17: TLabel
        Left = 127
        Top = 9
        Width = 17
        Height = 13
        Caption = 'sec'
      end
      object Label18: TLabel
        Left = 18
        Top = 36
        Width = 52
        Height = 13
        Caption = 'sap param:'
      end
      object Label19: TLabel
        Left = 18
        Top = 60
        Width = 51
        Height = 13
        Caption = 'sax param:'
      end
      object Label20: TLabel
        Left = 9
        Top = 83
        Width = 62
        Height = 13
        Caption = 'Add. params:'
      end
      object Label21: TLabel
        Left = 376
        Top = 0
        Width = 88
        Height = 13
        Caption = 'Internal messages:'
      end
      object DMallc: TCheckBox
        Left = 560
        Top = 0
        Width = 49
        Height = 17
        Hint = 'If selected, ALL debug messages will be shown below'
        Caption = 'ALL'
        TabOrder = 7
        OnClick = DMallcClick
      end
      object DMscroll: TCheckBox
        Left = 624
        Top = 0
        Width = 129
        Height = 17
        Hint = 'If selected, the listbox below will scroll to any new entry'
        Caption = 'Scroll at new message'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object Refresh: TEdit
        Left = 73
        Top = 6
        Width = 40
        Height = 21
        Hint = 'Refresh rate of state info in seconds.'
        TabOrder = 0
        Text = '0'
        OnChange = RefreshChange
      end
      object UpDown1: TUpDown
        Left = 113
        Top = 6
        Width = 12
        Height = 21
        Associate = Refresh
        ArrowKeys = False
        Max = 1000
        TabOrder = 1
        Thousands = False
      end
      object SETIsap: TEdit
        Left = 72
        Top = 32
        Width = 177
        Height = 21
        Hint = 
          'Commandline-parameter to tell the client to stop after current W' +
          'U is processed'
        TabOrder = 2
        Text = 'SETIsap'
      end
      object SETIsax: TEdit
        Left = 72
        Top = 56
        Width = 177
        Height = 21
        Hint = 
          'Commandline-parameter to tell the client to stop after a new WU ' +
          'is fetched'
        TabOrder = 3
        Text = 'SETIsax'
      end
      object AddParams: TEdit
        Left = 72
        Top = 80
        Width = 297
        Height = 21
        Hint = 
          'Additional parameters for the client (e.g. Proxy-info; See clien' +
          't help!)'
        TabOrder = 4
        Text = 'AddParams'
      end
      object DebugLB: TListBox
        Left = 376
        Top = 16
        Width = 377
        Height = 217
        TabStop = False
        ExtendedSelect = False
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 64
    Width = 289
    Height = 249
    Caption = 'User information [user_info.sah]'
    TabOrder = 0
    object Label4: TLabel
      Left = 10
      Top = 220
      Width = 71
      Height = 13
      Caption = 'Total CPUtime:'
    end
    object Label8: TLabel
      Left = 256
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Show'
    end
    object name: TEdit
      Left = 8
      Top = 48
      Width = 249
      Height = 21
      Hint = 'name [user_info.sah]'
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'name'
    end
    object email: TEdit
      Left = 8
      Top = 72
      Width = 249
      Height = 21
      Hint = 'email_addr [user_info.sah]'
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      Text = 'email'
    end
    object url: TEdit
      Left = 8
      Top = 96
      Width = 249
      Height = 21
      Hint = 'url [user_info.sah]'
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      Text = 'url'
    end
    object Showname: TCheckBox
      Left = 264
      Top = 48
      Width = 17
      Height = 17
      Hint = 'show_name [user_info.sah] --- Show your name to other users?'
      TabStop = False
      TabOrder = 3
      OnClick = ShownameClick
    end
    object Showemail: TCheckBox
      Left = 264
      Top = 72
      Width = 17
      Height = 17
      Hint = 
        'show_email [user_info.sah] --- Show your email-address to other ' +
        'users?'
      TabStop = False
      TabOrder = 4
      OnClick = ShowemailClick
    end
    object country: TEdit
      Left = 8
      Top = 120
      Width = 161
      Height = 21
      Hint = 'country [user_info.sah]'
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
      Text = 'country'
    end
    object postalcode: TEdit
      Left = 176
      Top = 120
      Width = 81
      Height = 21
      Hint = 'postal_code [user_info.sah]'
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
      Text = 'postalcode'
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 144
      Width = 273
      Height = 65
      Caption = 'Work units'
      TabOrder = 7
      object Label2: TLabel
        Left = 24
        Top = 16
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Received:'
      end
      object Label3: TLabel
        Left = 12
        Top = 40
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Results sent:'
      end
      object wur: TEdit
        Left = 75
        Top = 13
        Width = 38
        Height = 21
        Hint = 'nwus [user_info.sah]'
        TabStop = False
        BiDiMode = bdLeftToRight
        Color = clBtnFace
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 0
        Text = 'wur'
      end
      object wus: TEdit
        Left = 75
        Top = 37
        Width = 38
        Height = 21
        Hint = 'nresults [user_info.sah]'
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
        Text = 'wus'
      end
      object lwur: TEdit
        Left = 115
        Top = 13
        Width = 150
        Height = 21
        Hint = 'last_wu_time [user_info.sah]'
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
        Text = 'lwur'
      end
      object lwus: TEdit
        Left = 115
        Top = 37
        Width = 150
        Height = 21
        Hint = 'last_result_time [user_info.sah]'
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
        Text = 'lwus'
      end
    end
    object regged: TEdit
      Left = 96
      Top = 24
      Width = 161
      Height = 21
      Hint = 'register_time [user_info.sah]'
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
      Text = 'regged'
    end
    object cputime: TEdit
      Left = 84
      Top = 216
      Width = 141
      Height = 21
      Hint = 'total_cpu [user_info.sah]'
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
      Text = 'cputime'
    end
    object id: TEdit
      Left = 8
      Top = 24
      Width = 81
      Height = 21
      Hint = 'id [user_info.sah]'
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      Text = 'id'
    end
  end
  object SETIdir: TEdit
    Left = 384
    Top = 56
    Width = 393
    Height = 21
    Hint = 'The directory to the SETI@home-client.'
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
    Text = 'SETIdir'
  end
  object clive: TEdit
    Left = 480
    Top = 32
    Width = 41
    Height = 21
    Hint = 'major_version / minor_version [version.sah]'
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
    Text = 'clive'
  end
  object GroupBox3: TGroupBox
    Left = 304
    Top = 88
    Width = 473
    Height = 225
    Caption = 'Current Work unit [work_unit.sah]'
    TabOrder = 8
    object Label6: TLabel
      Left = 10
      Top = 52
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Received:'
    end
    object Label7: TLabel
      Left = 222
      Top = 52
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'from'
    end
    object Label13: TLabel
      Left = 247
      Top = 196
      Width = 63
      Height = 13
      Caption = 'Downloaded:'
    end
    object Label22: TLabel
      Left = 328
      Top = 8
      Width = 123
      Height = 13
      Caption = 'Sky Coordinates (from/to):'
    end
    object Label23: TLabel
      Left = 165
      Top = 75
      Width = 80
      Height = 13
      Caption = 'Base Frequency:'
    end
    object Label24: TLabel
      Left = 159
      Top = 99
      Width = 87
      Height = 13
      Caption = 'Center Frequency:'
    end
    object Label25: TLabel
      Left = 178
      Top = 123
      Width = 67
      Height = 13
      Caption = 'Sampling rate:'
    end
    object Label26: TLabel
      Left = 400
      Top = 80
      Width = 60
      Height = 13
      Caption = 'Angle range:'
    end
    object wuname: TEdit
      Left = 8
      Top = 24
      Width = 305
      Height = 21
      Hint = 'name [work_unit.sah]'
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'wuname'
    end
    object timerec: TEdit
      Left = 64
      Top = 48
      Width = 153
      Height = 21
      Hint = 'time_recorded [work_unit.sah]'
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      Text = 'timerec'
    end
    object receiver: TEdit
      Left = 248
      Top = 48
      Width = 65
      Height = 21
      Hint = 'receiver [work_unit.sah]'
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      Text = 'receiver'
    end
    object positions: TListBox
      Left = 8
      Top = 72
      Width = 145
      Height = 145
      Hint = 'coordxx [work_unit.sah]'
      TabStop = False
      ExtendedSelect = False
      ItemHeight = 13
      Sorted = True
      TabOrder = 3
    end
    object WUdld: TEdit
      Left = 312
      Top = 192
      Width = 153
      Height = 21
      Hint = 'Date of work_unit.sah'
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
      Text = 'WUdld'
    end
    object SkyCoord: TEdit
      Left = 328
      Top = 24
      Width = 137
      Height = 21
      Hint = 'start_ra / start_dec [work_unit.sah]'
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
      Text = 'SkyCoord'
    end
    object SkyCoord2: TEdit
      Left = 328
      Top = 48
      Width = 137
      Height = 21
      Hint = 'end_ra / end_dec [work_unit.sah]'
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
      Text = 'SkyCoord2'
    end
    object BaseFreq: TEdit
      Left = 248
      Top = 72
      Width = 113
      Height = 21
      Hint = 'subband_base [work_unit.sah]'
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
      Text = 'BaseFreq'
    end
    object CenterFreq: TEdit
      Left = 248
      Top = 96
      Width = 113
      Height = 21
      Hint = 'subband_center [work_unit.sah]'
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
      Text = 'CenterFreq'
    end
    object SampleRate: TEdit
      Left = 248
      Top = 120
      Width = 65
      Height = 21
      Hint = 'subband_sample_rate [work_unit.sah]'
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
      Text = 'SampleRate'
    end
    object AngleRange: TEdit
      Left = 400
      Top = 96
      Width = 65
      Height = 21
      Hint = 'angle_range [work_unit.sah]'
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
      Text = 'AngleRange'
    end
  end
  object CheckBox1: TCheckBox
    Left = 688
    Top = 32
    Width = 97
    Height = 17
    Hint = 
      'Switches alpha-blending on and off. (Requires Windows 2000 or ne' +
      'wer and a Pentium 90 or newer)'
    Caption = 'Alpha blending'
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object SETIdirn: TComboBox
    Left = 408
    Top = 8
    Width = 369
    Height = 21
    AutoComplete = False
    ItemHeight = 13
    TabOrder = 1
    Text = 'SETIdirn'
    OnChange = SETIdirnChange
  end
  object AddPathButton: TButton
    Left = 536
    Top = 32
    Width = 81
    Height = 17
    Hint = 
      'If the above entry does not exist, renames the last selected ent' +
      'ry or adds a new one. If the above entered entry does exist, cha' +
      'nges the path of it.'
    Caption = 'Add/Edit Path'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = AddPathButtonClick
  end
  object DelPathButton: TButton
    Left = 624
    Top = 32
    Width = 49
    Height = 17
    Hint = 'Deletes the currently selected directory entry'
    Caption = 'Del Path'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = DelPathButtonClick
  end
  object prog: TProgressBar
    Left = 8
    Top = 325
    Width = 705
    Height = 12
    Hint = 'prog [state.sah]'
    Max = 10000
    Smooth = True
    TabOrder = 9
  end
  object progn: TEdit
    Left = 720
    Top = 316
    Width = 57
    Height = 21
    Hint = 'prog [state.sah]'
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
    Text = 'progn'
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 32
  end
  object PopupMenu: TPopupMenu
    Left = 96
    object ShowHideItem: TMenuItem
      Caption = '&Show/Hide'
      Default = True
      OnClick = ShowHideItemClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ExitItem: TMenuItem
      Caption = 'E&xit'
      OnClick = ExitItemClick
    end
  end
  object TrayIcon: TCoolTrayIcon
    CycleInterval = 0
    Icon.Data = {
      0000010001002020040000000000E80200001600000028000000200000004000
      0000010004000000000000020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006444
      4444444444444444444444444400666666666666666666666666666666007FFF
      FFFFFFFFFFFFFFFFFFFFFFFFF7006FFFFFFFFFFFFFFFFFFFFFFFFFFFF7006FFF
      FFFFFFFFFFFFFFFFFFFFFFFFF7006FFFFFFFFFFFFFFFFFFFFFFFFFFFF7006FFF
      FFFFFFFFFFFFFFFFFFFFFFFFF7006FFFFFFFFFFFFFFFFFFFFFFFFFFFF7006FFF
      FFFFFFFFFFFFFFFFFFFFFFFFF7006FFFFFFFFFFFFFFFFFFFFFFFFFFFF7006FFF
      FFFFFFFFFFFFFFFFFFFFFFFFF7006FFFFFFFFFFFFFFFFFFFFFFFFFFFF7006FFF
      FFFFFFFFFFFFFFFFFFFFFFFFF7006FFFFFFFFFFFFFFFFFFFFFFFFFFFF7006FFF
      FFFFFFFFFFFFFFFFFFFFFFFFF8006FFFFFFFFFFFFFFFFFFFFFFFFFFFF8006FFF
      FFFFFFFFFFFFFFFFFFFFFFFFF8006FFFFFFFFFFFFFFFFFFFFFFFFFFFF8006FFF
      FFFFFFFFFFFFFFFFFFFFFFFFF8006FFFFFFFFFFFFFFFFFFFFFFFFFFFF8006888
      8888888888888888888888888600666666666666666666666664666666006666
      666666666666666666867E697600668EEEEEEEEEEEEEEEE66EE6EE6766006666
      6666666666666666666666666600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF8000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFF}
    IconVisible = True
    IconIndex = 0
    PopupMenu = PopupMenu
    OnClick = ShowHideItemClick
    Left = 144
    Top = 65200
  end
end
