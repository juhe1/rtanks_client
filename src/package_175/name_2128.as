package package_175
{
   import controls.base.LabelBase;
   import forms.name_1139;
   
   public class name_2128 extends class_151
   {
      
      private static const const_2197:int = 9;
      
      private static const const_2198:int = 7;
       
      
      private var var_1775:LabelBase;
      
      public function name_2128(param1:String)
      {
         super(null,param1,true);
      }
      
      override protected function init() : void
      {
         super.init();
         this.var_1775 = new LabelBase();
         this.var_1775.color = name_1139.name_1894;
         this.var_1775.mouseEnabled = false;
         addChild(this.var_1775);
         this.var_1775.htmlText = message;
      }
      
      override protected function resize() : void
      {
         this.var_1775.x = 11 + 9;
         this.var_1775.y = 11 + 7;
         var_1450 = this.var_1775.y + this.var_1775.height - 3;
         _height = var_1450 + 2 * 7 + 11 - 2;
         _width = 11 * 2 + 9 * 2 + this.var_1775.width;
         super.resize();
      }
   }
}
