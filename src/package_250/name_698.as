package package_250
{
   import controls.base.name_1134;
   import controls.base.name_998;
   import flash.events.MouseEvent;
   import forms.name_1139;
   import package_175.class_151;
   import package_54.name_102;
   
   public class name_698 extends class_151
   {
      
      private static const const_1576:int = 96;
      
      public static var localeService:name_102;
       
      
      private var messageLabel:name_1134;
      
      private var var_1276:name_998;
      
      private var var_1451:name_998;
      
      public function name_698()
      {
         super(null,"ERROR_FATAL");
         this.messageLabel = new name_1134();
         this.messageLabel.text = "Произошла критическая ошибка";
         this.messageLabel.color = name_1139.name_1894;
         this.messageLabel.mouseEnabled = false;
         addChild(this.messageLabel);
         this.var_1451 = new name_998();
         this.var_1451.width = 96 + 15;
         this.var_1451.label = "Перезайти в игру";
         addChild(this.var_1451);
         this.var_1276 = new name_998();
         this.var_1276.width = 96;
         this.var_1276.label = "ОК";
         addChild(this.var_1276);
         this.var_1451.addEventListener(MouseEvent.CLICK,this.method_1662,false,0,true);
         this.var_1276.addEventListener(MouseEvent.CLICK,this.method_1552,false,0,true);
      }
      
      private function method_1552(param1:MouseEvent) : void
      {
         hide();
      }
      
      private function method_1662(param1:MouseEvent) : void
      {
         hide();
      }
      
      override protected function resize() : void
      {
         this.messageLabel.x = 11 + 9;
         this.messageLabel.y = 11 + 11;
         var_1450 = this.messageLabel.y + this.messageLabel.height - 3;
         var _loc1_:int = this.messageLabel.x + this.messageLabel.width + 11 * 2;
         if(_loc1_ > _width)
         {
            _width = _loc1_;
         }
         var _loc2_:int = var_1450 + 16;
         this.var_1276.x = 11;
         this.var_1276.y = _loc2_;
         this.var_1451.x = _width - this.var_1451.width - 11;
         this.var_1451.y = _loc2_;
         _height = this.var_1451.y + this.var_1451.height + 11 + 1;
         super.resize();
      }
   }
}
