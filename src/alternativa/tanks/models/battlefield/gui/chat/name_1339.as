package alternativa.tanks.models.battlefield.gui.chat
{
   import controls.Label;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   
   public class name_1339 extends Sprite
   {
      
      public static var name_1343:String = "";
       
      
      private var label:Label;
      
      public function name_1339()
      {
         super();
         this.label = new Label();
         this.label.color = name_1135.name_1140;
         this.label.autoSize = TextFieldAutoSize.LEFT;
         this.label.multiline = true;
         this.label.wordWrap = true;
         this.label.mouseEnabled = false;
         this.label.text = name_1343;
         addChild(this.label);
      }
      
      public function name_1342(param1:String) : void
      {
         this.label.text = param1;
      }
      
      public function name_1347(param1:Number) : void
      {
         this.label.width = param1;
      }
      
      public function getText() : String
      {
         return this.label.text;
      }
   }
}
