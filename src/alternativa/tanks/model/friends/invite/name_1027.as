package alternativa.tanks.model.friends.invite
{
   import controls.base.LabelBase;
   import forms.name_1139;
   import package_175.class_151;
   import package_390.name_1889;
   
   public class name_1027 extends class_151
   {
       
      
      private var var_1775:LabelBase;
      
      private var var_1367:name_1889;
      
      public function name_1027(param1:String, param2:String)
      {
         super(param1,param2);
      }
      
      override protected function init() : void
      {
         super.init();
         this.var_1367 = new name_1889(userId);
         addChild(this.var_1367);
         this.var_1775 = new LabelBase();
         this.var_1775.mouseEnabled = false;
         addChild(this.var_1775);
         this.var_1775.color = name_1139.name_1894;
         this.var_1775.text = message;
      }
      
      override protected function resize() : void
      {
         this.var_1367.x = 11 + 7;
         this.var_1367.y = 11 + 5;
         this.var_1775.x = 11 + 9;
         this.var_1775.y = this.var_1367.y + this.var_1367.height - 1;
         var_1450 = this.var_1775.y + this.var_1775.height - 3;
         var _loc1_:int = this.var_1775.x + this.var_1775.width + 11 * 2;
         if(_loc1_ > _width)
         {
            _width = _loc1_;
         }
         _height = var_1450 + 11 * 2 + 1;
         super.resize();
      }
   }
}
