package alternativa.utils
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class DebugPanel extends Sprite
   {
       
      
      private var method_393:Dictionary;
      
      private var count:int;
      
      public function DebugPanel()
      {
         super();
         this.method_393 = new Dictionary();
         mouseEnabled = false;
         tabEnabled = false;
         mouseChildren = false;
         tabChildren = false;
      }
      
      public function name_773(param1:String, ... rest) : void
      {
         var _loc3_:TextField = this.method_393[param1];
         if(_loc3_ == null)
         {
            _loc3_ = this.method_242();
            this.method_393[param1] = _loc3_;
         }
         _loc3_.text = param1 + ": " + rest.join(" ");
      }
      
      public function method_1618(param1:String) : void
      {
         this.method_242().text = param1;
      }
      
      private function method_242() : TextField
      {
         var _loc1_:TextField = null;
         _loc1_ = new TextField();
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         addChild(_loc1_);
         _loc1_.defaultTextFormat = new TextFormat("Tahoma",11,16777215);
         _loc1_.y = this.count * 20;
         ++this.count;
         return _loc1_;
      }
   }
}
