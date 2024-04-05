package controls
{
   import flash.display.Sprite;
   
   public class name_871 extends Sprite
   {
      
      private static const const_1609:int = 3;
      
      private static const const_1606:uint = 1244928;
      
      private static const const_1607:uint = 11;
      
      private static const const_1608:uint = 1;
       
      
      private var var_1670:Label;
      
      private var var_1671:Label;
      
      private var var_1669:Label;
      
      private var score:int;
      
      private var var_1672:int;
      
      private var crystals:int;
      
      private var rating:String;
      
      public function name_871()
      {
         this.var_1670 = new Label();
         this.var_1671 = new Label();
         super();
      }
      
      public function method_1837(param1:int) : void
      {
         this.score = param1;
         this.update();
      }
      
      public function method_1836(param1:int) : void
      {
         this.var_1672 = param1;
         this.update();
      }
      
      public function method_1835(param1:int) : void
      {
         this.crystals = param1;
         this.update();
      }
      
      public function name_877(param1:int) : void
      {
         this.rating = param1.toString();
         this.update();
      }
      
      public function update() : void
      {
         this.method_1831();
         this.method_1832(this.var_1670,this.var_1671,"R:",this.rating);
      }
      
      private function method_1831() : void
      {
         this.var_1669 = null;
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
      }
      
      private function method_1832(param1:Label, param2:Label, param3:String, param4:String) : void
      {
         this.method_1830(param1,param3);
         this.method_1834(param2,param4);
      }
      
      private function method_1830(param1:Label, param2:String) : void
      {
         param1.color = 1244928;
         param1.text = param2;
         if(this.var_1669 != null)
         {
            this.method_1833(param1,this.var_1669);
         }
         addChild(param1);
         this.var_1669 = param1;
      }
      
      private function method_1834(param1:Label, param2:String) : void
      {
         param1.size = 11;
         param1.y = 1;
         this.method_1830(param1,param2);
      }
      
      private function method_1833(param1:Label, param2:Label) : void
      {
         param1.x = param2.x + param2.textWidth + 3;
      }
   }
}
