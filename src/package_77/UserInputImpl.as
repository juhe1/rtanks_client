package package_77
{
   import alternativa.tanks.utils.name_1398;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   
   public class UserInputImpl implements class_185, class_47
   {
      
      public static const const_1936:int = 0;
      
      public static const const_1934:int = 1;
      
      public static const const_1930:int = 2;
      
      public static const const_1932:int = 3;
      
      public static const const_1927:int = 4;
      
      public static const const_1937:int = 5;
      
      public static const const_1935:int = 6;
      
      public static const const_1929:int = 7;
      
      public static const const_1933:int = 8;
      
      public static const const_1928:int = 9;
      
      public static const const_1931:int = 10;
      
      private static const const_1926:int = 1 << 10 | 1 << 9 | 1 << 7 | 1 << 8;
       
      
      private var var_2340:Dictionary;
      
      private var var_26:name_1398;
      
      public function UserInputImpl()
      {
         this.var_2340 = new Dictionary();
         this.var_26 = new name_1398();
         super();
         this.var_2340[Keyboard.W] = 0;
         this.var_2340[Keyboard.S] = 1;
         this.var_2340[Keyboard.A] = 2;
         this.var_2340[Keyboard.D] = 3;
         this.var_2340[Keyboard.Q] = 5;
         this.var_2340[Keyboard.E] = 4;
         this.var_2340[Keyboard.SHIFT] = 6;
         this.var_2340[Keyboard.LEFT] = 7;
         this.var_2340[Keyboard.RIGHT] = 8;
         this.var_2340[Keyboard.UP] = 9;
         this.var_2340[Keyboard.DOWN] = 10;
      }
      
      public function method_2358() : int
      {
         return this.name_1755(0,1);
      }
      
      public function method_2360() : int
      {
         return this.name_1755(3,2);
      }
      
      public function method_2359() : int
      {
         return this.name_1755(4,5);
      }
      
      public function method_2361() : Boolean
      {
         return this.var_26.method_605(6) == 1;
      }
      
      public function method_190(param1:KeyboardEvent) : void
      {
         if(this.var_2340[param1.keyCode] != null)
         {
            this.var_26.name_2080(this.var_2340[param1.keyCode]);
         }
      }
      
      public function method_1036(param1:KeyboardEvent) : void
      {
         if(this.var_2340[param1.keyCode] != null)
         {
            this.var_26.name_2078(this.var_2340[param1.keyCode]);
         }
      }
      
      public function name_1520() : int
      {
         return this.name_1755(7,8);
      }
      
      public function name_1524() : int
      {
         return this.name_1755(9,10);
      }
      
      public function name_948() : Boolean
      {
         return this.var_26.name_1407(const_1926);
      }
      
      private function name_1755(param1:int, param2:int) : int
      {
         return this.var_26.method_605(param1) - this.var_26.method_605(param2);
      }
      
      public function reset() : void
      {
         this.var_26.clear();
      }
   }
}
