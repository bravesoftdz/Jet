inherited frmErrorBox: TfrmErrorBox
  Caption = 'frmErrorBox'
  ClientHeight = 129
  ClientWidth = 357
  ExplicitWidth = 357
  ExplicitHeight = 129
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 357
    BorderColor = 3942139
    Color = 4666363
    GradientColorStart = 3810810
    GradientColorStop = 3810810
    ExplicitWidth = 357
    inherited imgClose: TImage
      Left = 336
      ExplicitLeft = 336
    end
    inherited lblCaption: TRzLabel
      Width = 28
      Caption = 'Error'
      ExplicitWidth = 28
    end
  end
  inherited pnlMain: TRzPanel
    Width = 357
    Height = 108
    BorderColor = 3942139
    Color = 10655996
    ExplicitWidth = 357
    ExplicitHeight = 108
    object lblMessage: TJvLabel
      Left = 59
      Top = 21
      Width = 280
      Height = 68
      AutoSize = False
      Caption = 'Errors have been found. Unable to save record.'
      Transparent = True
      WordWrap = True
    end
    object Image1: TImage
      Left = 21
      Top = 16
      Width = 32
      Height = 32
      Anchors = [akTop, akRight]
      AutoSize = True
      DragCursor = crArrow
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000000
        097048597300000048000000480046C96B3E0000000976704167000000200000
        00200087FA9C9D0000038A4944415478DAA5977F48136118C7BF9BA963B6A5B3
        32330ADB6DA92D150DC9502B4AA2A4A848B23FA45F1414149115164944615229
        9150A044857F641425854554F49314515153D3ED2C8A7E97669B9AD39ABD77ED
        6473BBBD77F381977BDFF7EEF97E3FB77BEFBD670A788FA0178B13ED5C27ED49
        5330390CC1BFA0EA28C492E24F14F383962379FE4248D251784D3A7A12BF0AF7
        F113930E97A0E5D821B910927546014AE2F55353749AAFA6C3C7603B9DEFA6A6
        395084D6C2A352217873A93A3C4091293A226DF2A42FA68305E83B5BE05575E2
        DEE3683D759C06F1DF5C868E42489ABB2F1F03E74FF8BC35F5AE23682B291283
        F04B87030823893D71BBF33078F10CF5E1AAB6ED477B69F15808DEDC0F0D1D0F
        409A9108D4C6EDDC037B45295520387737DA2F9C1320C09BCBCF5D408666FE11
        903695B46822F42C76FB2E0C5F2BA30A056ED881D7E5E7F9BEDC1C629E41866F
        49FB26BC056E10319BB7E36FD515AAA075C8C11FB5414AEAB5016B36A1E372B9
        9B399C8B50087788DC2D7054575285A584322B071D15973CCCB9731E1B912BC4
        9C8DB9C0839BE373CF5C87CEAB155ECDBD01784264E740F9F4AE5FDE8E452BD1
        79BD52D45C0CC003C2B8763D26D43C9465FE277519CCB76EF834F705E009B17A
        0D02EB9F49321F9E9F01F3ED2AAA390D4080984100BA8C59AB10D45C2B096028
        6101CCD57738003D197E808FEF071580DB640CCB5740F5BA51EAAFCFC7606C12
        2CF7EF513F603E1F01676E5C9A0955579B2CF35108FD5C981F3DF00921BA08F9
        3B5FBC04EAF716BFCC8518986980E5C963E91591501718D2D311F2F9DDB8CC85
        E88F9C05CBF3E7F48A48A80B98D485D0747FA60AF7586DFC51A7D550AFB58547
        82AD79295E118D9AA7A4406BEDA60A5AB5E160EBEAF8BEDC1CD18A88494E46E8
        A08D2AD4ABD2806D68C0D6FACE6C73DFEF7EB25EEECACDF5A88898C44484FD1D
        A40AFC5406836D6EC68E467356BB75A0934C8D9016C56D564C4202C21C76BA46
        800A6C53937B45C4CC3341A71CF199D8E350807DD52A98B792A9AF4E80D11D53
        8E8E4745C4C4C5203C38D06B52B77D186C7BC75873E176DDB66D293AA2151163
        3460B246ED96F4C33600D66C11338757081F3AD48A88D1CFC6145D287FE27B4F
        2FD8AE37347348D5915C1131FA687E92ED7A2BD5DC4D274EAB8E2F4B3256BBEA
        C8AE88B80999E6AE3AD30884898370D169818C8A28CA79FE934C7321B8F73C82
        B4E9CEF147A78EE48A28C4D9EFC738FE9ED374FE0194F8299BB484CC9E000000
        3374455874636F6D6D656E740043726F73732066726F6D2049636F6E2047616C
        6C65727920687474703A2F2F69636F6E67616C2E636F6D2FECD7B5D000000025
        74455874646174653A63726561746500323031312D30382D32315431343A3132
        3A31322D30363A30302E6E0EB70000002574455874646174653A6D6F64696679
        00323031312D30382D32315431343A31323A31322D30363A30305F33B60B0000
        001974455874536F6674776172650041646F626520496D616765526561647971
        C9653C0000000049454E44AE426082}
    end
    object pnlClose: TRzPanel
      Left = 299
      Top = 78
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 3942139
      BorderWidth = 1
      Color = 7891452
      TabOrder = 0
      object btnClose: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        BorderStyle = bsNone
        Caption = 'Close'
        OnClick = btnCloseClick
      end
    end
  end
end
