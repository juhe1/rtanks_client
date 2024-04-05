package package_12
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   
   public class name_529 implements name_24
   {
       
      
      private var _stage:Stage;
      
      private var var_1103:DisplayObjectContainer;
      
      private var var_1094:DisplayObjectContainer;
      
      private var var_1097:DisplayObjectContainer;
      
      private var var_1096:DisplayObjectContainer;
      
      private var var_1098:DisplayObjectContainer;
      
      private var var_1100:DisplayObjectContainer;
      
      private var var_1101:DisplayObjectContainer;
      
      private var var_1099:DisplayObjectContainer;
      
      private var var_1102:DisplayObjectContainer;
      
      private var var_1095:DisplayObjectContainer;
      
      public function name_529(param1:Stage, param2:DisplayObjectContainer)
      {
         super();
         this._stage = param1;
         this.var_1094 = param2;
         this.var_1103 = this.var_1094.parent;
         this.var_1097 = this.method_1300();
         this.var_1096 = this.method_1300();
         this.var_1098 = this.method_1300();
         this.var_1100 = this.method_1300();
         this.var_1101 = this.method_1300();
         this.var_1099 = this.method_1300();
         this.var_1102 = this.method_1300();
         this.var_1095 = this.method_1300();
      }
      
      private function method_1300() : Sprite
      {
         var _loc1_:Sprite = null;
         _loc1_ = new Sprite();
         _loc1_.mouseEnabled = false;
         _loc1_.tabEnabled = false;
         this.var_1094.addChild(_loc1_);
         return _loc1_;
      }
      
      public function get stage() : Stage
      {
         return this._stage;
      }
      
      public function get mainContainer() : DisplayObjectContainer
      {
         return this.var_1094;
      }
      
      public function get backgroundLayer() : DisplayObjectContainer
      {
         return this.var_1097;
      }
      
      public function get contentLayer() : DisplayObjectContainer
      {
         return this.var_1096;
      }
      
      public function get contentUILayer() : DisplayObjectContainer
      {
         return this.var_1098;
      }
      
      public function get systemLayer() : DisplayObjectContainer
      {
         return this.var_1100;
      }
      
      public function get systemUILayer() : DisplayObjectContainer
      {
         return this.var_1101;
      }
      
      public function get dialogsLayer() : DisplayObjectContainer
      {
         return this.var_1099;
      }
      
      public function get noticesLayer() : DisplayObjectContainer
      {
         return this.var_1102;
      }
      
      public function get cursorLayer() : DisplayObjectContainer
      {
         return this.var_1095;
      }
   }
}
