   M S B A M L   `   `   `  ���� M  IDesktopDataGrabber, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullK*clr-namespace:DesktopDataGrabber.ViewModelDesktopDataGrabber.ViewModel  (    "DesktopDataGrabber.View.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     R NOxyPlot.Wpf, Version=2.0.0.0, Culture=neutral, PublicKeyToken=75e952ba404cdbb0 oxyhttp://oxyplot.org/wpf  3vm*clr-namespace:DesktopDataGrabber.ViewModel  $	��900��$
��1300��$	��900��$
��1300��  � 
ResizeMode$  NoResize=� � Title$ 	Sense HAT��$
��1239��$	��880�� � DataContext 0   *DesktopDataGrabber.ViewModel.MainViewModel  .���  � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto ��� $
��Auto � � ColumnDefinitions �� $
��Auto ��� $��* �.+��� -    ��Name$ MenuBtn��$��0��$��1��$	��118��$
��Left=�$��0,0,0,10q�$��Schowaj Menu��� -    �Name$
 Menu��$��0��$��1��
����2��$��
123,0,0,10q�$��30�� �� $
��Auto ��� $��50 ��� $
��Auto ��� $��50 ��� $
��Auto ��� $��50 ��� $
��Auto �.+��� -   $��1��$��839,0,10,20q�{�.  J� RenderTransformOrigin$ -3.14,-7.65&�.��	IMU CHART�� -   $��1��$��10,0,948,20q�{�. $ -9.74,-3.167&����	#FF0B0666 J� OpacityMask �� 	 �� EndPoint$	 0.5,1&�
 �� 
StartPoint$
 0.5,0&�.���  � Color$ Black�� � Offset$ 0Q�� $ 	#FF0E0881��$ 1Q�.��	ENV CHART�� -   $��1��$��228,0,651,20q�{�. $ 	5.9,6.823&�.��TABLE�� -   $��1��$��578,0,337,20q�{�. $ 
4.01,0.633&�.��LED  OxyPlot.Wpf.PlotView  -     Name$ DataPlotView_IMU��$��1��$��1��$��0,0,10,0q�$y�	Collapsed=�   Model �� *
IMUChart+  -   $ DataPlotView_temp��$��1��$��1��$��
0,0,10,500q�$y�	Collapsed=� �� *ENVChart_temp+  -	   $ DataPlotView_press��$��1��$��1��$��0,250,10,250q�$y�	Collapsed=� �� *ENVChart_press+  -
   $ DataPlotView_humid��$��1��$��1��$��
0,500,10,0q�$y�	Collapsed=� �� *ENVChart_humid+� $��2��$��1�� �� $
��Auto ��� $
��Auto ��� $
��358* ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��0��$��
20,17,0,17q�$��IP address: ��$��Center=��� $��1��$��	0,10,0,10q�$
��Auto��$
��Left=����� *	IpAddress+�� $��3��$
��0,17q�$��Sample time: ��$��Right=�$��Center=��� $��4��$��	0,10,0,10q�$��50��$
��Left=����� *
SampleTime+�� $��5��$��
0,17,20,17q�$	�� ms��$��Right=�$��Center=�� $��3��$��1�� �� $��* ��� $
��Auto ��� $
��Auto ��� $��* �.+��� $��0��$��30��$	��372��$��0,10,265,10q�$��Right=����� *StartButton+.��START�� $��30��$��402,10,544,10q�$��4������ *
StopButton+.��STOP�� $��3��$��30��$	��367��$��121,10,0,10q�$
��Left=����� *UpdateConfigButton+.��UPDATE CONFIG�� $��3��$��30��$	��130��$��507,10,0,10q�$
��Left=����� *DefaultConfigButton+.��DEFAULT CONFIG�� -   $��
Data_table��$y�	Collapsed=�$��1��$��1��$��Stretch=� �� SelectionMode$ Extended=�.@��  �� $��* ��� $
��Auto �.+��� $��0������ *Measurements+ �� View �� .P��� $
��Name�� �� Width$	 100�� �� DisplayMemberBinding �� *Nazwa+�� $
��Data��$	 100�� �� *	Wartość+�� $
��Unit��$	 100�� �� *	Jednostka+�� -   $��
Led_Matrix��$y�	Collapsed=�$��1��$��1��$��Stretch=�$ Extended=�.@�� $��0, 20, 0, 0q� �� $��27 ��� $��26 ��� $
��Auto � �� $
��Auto ��� $
��Auto �.+��� $��0��$��0��$��
Set color:��$��32(�$
��Bold"�$��30,10,100,0q�$��2���� $��0��$��2��$	��R: ��$��24(�$
��Bold"�$��30,10,100,0q��� $��2��$��24(�$��70,10,100,0q����� *R+�� $��2��$	��G: ��$��24(�$
��Bold"�$��254,10,-119,0q�$��6���� $��2��$��24(�$��30,10,-130,0q�$��5������ *G+�� $��5��$��2��$	��B: ��$��24(�$
��Bold"�$��215,10,-358,-10q��� $��2��$��24(�$��258,10,-358,0q�$��5������ *B+� $��0, 30, 0, 0q� �� $��27 ��� $��26 ��� $
��Auto � �� $
��Auto ��� $
��Auto �.+��� $��0��$��0��$��
Set pixel:��$��32(�$
��Bold"�$��20,10,100,0q�$��2���� $��0��$��2��$	��X: ��$��24(�$
��Bold"�$��	20,10,5,0q��� $��2��$��24(�$��70,10,100,0q����� *X+�� $��2��$	��Y: ��$��24(�$
��Bold"�$��254,10,-119,0q�$��6���� $��2��$��24(�$��30,10,-130,0q�$��5������ *Y+�� $
��SEND��$
��Left=�$��258,10,-363,0q�$	��112��$��1��$��2������ *
Send_Led+� $��0, 30, 0, 0q� �� $��27 ��� $��26 ��� $
��Auto � �� $
��Auto ��� $
��Auto �.+��� $��0��$��0��$��          Display text:��$��32(�$
��Bold"�$��30,10,100,0q�$��2���� $��0��$��2��$��Text: ��$��24(�$
��Bold"�$��30,10,100,0q��� $��2��$��24(�$��108,10,-89,0q�$��2������ *Text+�� $
��SEND��$
��Left=�$��108,10,-325,0q�$	��118��$��1��$��2������ *	Send_Text+�� -    ��Name$
 Im_1��$��2��$
��Left=�$��30��$��	654,0,0,0q�$	��Top=�$��52��$��	raspb.png��