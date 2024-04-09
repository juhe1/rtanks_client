package package_286
{
   import controls.base.LabelBase;
   import controls.base.DefaultButtonBase;
   import flash.events.MouseEvent;
   import forms.name_1139;
   import package_1.Main;
   import package_175.class_151;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_54.name_102;
   
   public class name_1026 extends class_151
   {
      
      public static var localeService:name_102;
       
      
      private var var_1866:LabelBase;
      
      private var var_1868:DefaultButtonBase;
      
      private var var_1867:DefaultButtonBase;
      
      private var panelModel:PanelModel;
      
      public function name_1026(param1:String)
      {
         super(null,param1,false);
         this.panelModel = PanelModel(Main.osgi.getService(name_115));
      }
      
      override protected function init() : void
      {
         super.init();
         this.var_1866 = new LabelBase();
         this.var_1866.color = name_1139.name_1894;
         this.var_1866.mouseEnabled = false;
         this.var_1866.htmlText = message;
         addChild(this.var_1866);
         this.var_1867 = new DefaultButtonBase();
         this.var_1867.label = "Продлить";
         addChild(this.var_1867);
         this.var_1868 = new DefaultButtonBase();
         this.var_1868.label = "Закрыть";
         addChild(this.var_1868);
      }
      
      override protected function method_1568() : void
      {
         super.method_1568();
         this.var_1867.addEventListener(MouseEvent.CLICK,this.method_2027);
         this.var_1868.addEventListener(MouseEvent.CLICK,this.method_2028);
      }
      
      override protected function method_1476() : void
      {
         super.method_1476();
         this.var_1867.removeEventListener(MouseEvent.CLICK,this.method_2027);
         this.var_1868.removeEventListener(MouseEvent.CLICK,this.method_2028);
      }
      
      private function method_2027(param1:MouseEvent = null) : void
      {
         hide();
         this.panelModel.getShop();
      }
      
      private function method_2028(param1:MouseEvent) : void
      {
         this.method_1655();
      }
      
      override protected function method_1655() : void
      {
         hide();
      }
      
      override protected function resize() : void
      {
         this.var_1866.x = 11 + 9;
         this.var_1866.y = 11 + 5;
         var_1450 = this.var_1866.y + this.var_1866.height - 3;
         var _loc1_:int = this.var_1866.x + this.var_1866.width + 11 * 2;
         if(_loc1_ > _width)
         {
            _width = _loc1_;
         }
         var _loc2_:int = var_1450 + 16;
         this.var_1867.x = 11;
         this.var_1867.y = _loc2_;
         this.var_1868.x = _width - this.var_1868.width - 11;
         this.var_1868.y = _loc2_;
         _height = this.var_1867.y + this.var_1867.height + 11 + 1;
         super.resize();
      }
   }
}
