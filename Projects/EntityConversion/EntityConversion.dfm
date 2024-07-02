object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnJsonToEntity: TButton
    Left = 17
    Top = 23
    Width = 112
    Height = 25
    Caption = 'Json to entity'
    TabOrder = 0
    OnClick = btnJsonToEntityClick
  end
  object btnEntityToJson: TButton
    Left = 17
    Top = 63
    Width = 112
    Height = 25
    Caption = 'Entity to json'
    TabOrder = 1
    OnClick = btnEntityToJsonClick
  end
  object btnKeyValuetoEntity: TButton
    Left = 17
    Top = 104
    Width = 112
    Height = 25
    Caption = 'Key/value to entity'
    TabOrder = 2
    OnClick = btnKeyValuetoEntityClick
  end
  object btnEntityToKeyValue: TButton
    Left = 17
    Top = 144
    Width = 112
    Height = 25
    Caption = 'Entity to key value'
    TabOrder = 3
    OnClick = btnEntityToKeyValueClick
  end
end
