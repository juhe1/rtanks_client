package controls
{
   import controls.buttons.base.class_181;
   import controls.buttons.name_2255;
   
   public class name_3636 extends class_181
   {
       
      
      private var _data:Object;
      
      public function name_3636()
      {
         super();
         _label.multiline = true;
         _label.wordWrap = true;
         _label.height = 45;
      }
      
      override protected function onDisable() : void
      {
         super.onDisable();
         setState(name_2255.DOWN);
         this.align();
      }
      
      override protected function onEnable() : void
      {
         super.onEnable();
         this.align();
      }
      
      override public function set label(param1:String) : void
      {
         super.label = param1;
         this.align();
      }
      
      override protected function method_1960() : void
      {
         super.method_1960();
         this.align();
      }
      
      private function align() : void
      {
         var _loc1_:int = method_1174() == name_2255.DOWN ? int(1) : int(0);
         _label.y = int(25 - _label.textHeight / 2) + _loc1_;
         var_2222.y = 24 + _loc1_;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
   }
}
