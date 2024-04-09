package alternativa.tanks.model.shop
{
   import controls.base.LabelBase;
   import flash.display.Sprite;
   
   public class name_3393 extends Sprite
   {
       
      
      private var var_2564:String;
      
      private var var_3429:String;
      
      private var var_3680:LabelBase;
      
      private var var_1278:LabelBase;
      
      public function name_3393(param1:String, param2:String)
      {
         super();
         this.var_2564 = param1;
         this.var_3429 = param2;
         this.init();
      }
      
      private function init() : void
      {
         this.method_2312();
         this.method_3084();
      }
      
      private function method_2312() : void
      {
         this.var_3680 = new LabelBase();
         this.var_3680.size = 18;
         this.var_3680.text = this.var_2564;
         addChild(this.var_3680);
      }
      
      private function method_3084() : void
      {
         this.var_1278 = new LabelBase();
         this.var_1278.htmlText = this.var_3429;
         this.var_1278.wordWrap = true;
         addChild(this.var_1278);
      }
      
      public function render(param1:int) : void
      {
         this.var_3680.width = param1;
         this.var_1278.width = param1;
         this.var_1278.y = this.var_3680.y + this.var_3680.height;
      }
   }
}
