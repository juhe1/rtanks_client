package package_33
{
   import alternativa.osgi.OSGi;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class KeyCodesConverter
   {
      
      private static var var_2884:Dictionary;
      
      public static var localeService:name_102 = name_102(OSGi.getInstance().name_6(name_102));
       
      
      public function KeyCodesConverter()
      {
         super();
         this.method_2719();
      }
      
      public function name_2244(param1:uint) : String
      {
         var _loc2_:String = String(var_2884[param1]);
         return _loc2_ == null ? "" : _loc2_;
      }
      
      private function method_2719() : void
      {
         var_2884 = new Dictionary();
         var_2884[Keyboard.NUMBER_0] = "0";
         var_2884[Keyboard.NUMBER_1] = "1";
         var_2884[Keyboard.NUMBER_2] = "2";
         var_2884[Keyboard.NUMBER_3] = "3";
         var_2884[Keyboard.NUMBER_4] = "4";
         var_2884[Keyboard.NUMBER_5] = "5";
         var_2884[Keyboard.NUMBER_6] = "6";
         var_2884[Keyboard.NUMBER_7] = "7";
         var_2884[Keyboard.NUMBER_8] = "8";
         var_2884[Keyboard.NUMBER_9] = "9";
         var_2884[Keyboard.MINUS] = "-";
         var_2884[Keyboard.EQUAL] = "=";
         var_2884[Keyboard.Q] = "Q";
         var_2884[Keyboard.W] = "W";
         var_2884[Keyboard.E] = "E";
         var_2884[Keyboard.R] = "R";
         var_2884[Keyboard.T] = "T";
         var_2884[Keyboard.Y] = "Y";
         var_2884[Keyboard.U] = "U";
         var_2884[Keyboard.I] = "I";
         var_2884[Keyboard.O] = "O";
         var_2884[Keyboard.P] = "P";
         var_2884[Keyboard.A] = "A";
         var_2884[Keyboard.S] = "S";
         var_2884[Keyboard.D] = "D";
         var_2884[Keyboard.F] = "F";
         var_2884[Keyboard.G] = "G";
         var_2884[Keyboard.H] = "H";
         var_2884[Keyboard.J] = "J";
         var_2884[Keyboard.K] = "K";
         var_2884[Keyboard.L] = "L";
         var_2884[Keyboard.Z] = "Z";
         var_2884[Keyboard.X] = "X";
         var_2884[Keyboard.C] = "C";
         var_2884[Keyboard.V] = "V";
         var_2884[Keyboard.B] = "B";
         var_2884[Keyboard.N] = "N";
         var_2884[Keyboard.M] = "M";
         var_2884[Keyboard.LEFT] = localeService.getText(name_390.const_678);
         var_2884[Keyboard.UP] = localeService.getText(name_390.const_673);
         var_2884[Keyboard.RIGHT] = localeService.getText(name_390.const_550);
         var_2884[Keyboard.DOWN] = localeService.getText(name_390.const_924);
         var_2884[Keyboard.NUMPAD_0] = "NumPad 0";
         var_2884[Keyboard.NUMPAD_1] = "NumPad 1";
         var_2884[Keyboard.NUMPAD_2] = "NumPad 2";
         var_2884[Keyboard.NUMPAD_3] = "NumPad 3";
         var_2884[Keyboard.NUMPAD_4] = "NumPad 4";
         var_2884[Keyboard.NUMPAD_5] = "NumPad 5";
         var_2884[Keyboard.NUMPAD_6] = "NumPad 6";
         var_2884[Keyboard.NUMPAD_7] = "NumPad 7";
         var_2884[Keyboard.NUMPAD_8] = "NumPad 8";
         var_2884[Keyboard.NUMPAD_9] = "NumPad 9";
         var_2884[Keyboard.NUMPAD_ADD] = "NumPad +";
         var_2884[Keyboard.NUMPAD_SUBTRACT] = "NumPad -";
         var_2884[Keyboard.NUMPAD_DECIMAL] = "NumPad .";
         var_2884[Keyboard.NUMPAD_DIVIDE] = "NumPad /";
         var_2884[Keyboard.NUMPAD_ENTER] = "NumPad Enter";
         var_2884[Keyboard.LEFTBRACKET] = "[";
         var_2884[Keyboard.RIGHTBRACKET] = "]";
         var_2884[Keyboard.BACKSLASH] = "\\";
         var_2884[Keyboard.SEMICOLON] = ";";
         var_2884[Keyboard.QUOTE] = "\'";
         var_2884[Keyboard.COMMA] = ",";
         var_2884[Keyboard.PERIOD] = ".";
         var_2884[Keyboard.SLASH] = "/";
         var_2884[Keyboard.PAGE_DOWN] = localeService.getText(name_390.const_611);
         var_2884[Keyboard.PAGE_UP] = localeService.getText(name_390.const_895);
         var_2884[Keyboard.SPACE] = localeService.getText(name_390.const_617);
         var_2884[Keyboard.SHIFT] = "Shift";
      }
   }
}
