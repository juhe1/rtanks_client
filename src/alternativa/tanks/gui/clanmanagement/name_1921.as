package alternativa.tanks.gui.clanmanagement
{
   import base.class_122;
   import controls.base.name_1134;
   import flash.display.Bitmap;
   import flash.display.Shape;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.text.TextFormatAlign;
   
   public class name_1921 extends class_122
   {
      
      private static const WIDTH:Number = 120;
      
      private static const const_1532:Number = 100;
       
      
      private var image:Bitmap;
      
      private var var_1777:name_1134;
      
      private var var_2633:name_1134;
      
      private var var_2634:String;
      
      public function name_1921(param1:Bitmap, param2:String, param3:String)
      {
         super();
         this.image = param1;
         this.var_1777 = new name_1134();
         this.var_1777.align = TextFormatAlign.CENTER;
         this.var_1777.wordWrap = true;
         this.var_1777.multiline = true;
         this.var_2633 = new name_1134();
         this.var_2633.size = 16;
         this.var_2633.bold = true;
         this.image.x = 120 - this.image.bitmapData.width >> 1;
         this.image.y = 100 - this.image.bitmapData.height >> 1;
         this.var_1777.text = param2;
         this.var_1777.width = 120;
         this.var_1777.y = 5;
         this.setValue(param3);
         var _loc4_:Shape = new Shape();
         _loc4_.graphics.beginFill(676609,1);
         _loc4_.graphics.lineStyle(0,5177127,1);
         _loc4_.graphics.drawRoundRect(0,0,120,100,6,6);
         _loc4_.graphics.endFill();
         addChild(_loc4_);
         addChild(this.image);
         addChild(this.var_1777);
         addChild(this.var_2633);
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStage);
      }
      
      private function addedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.addedToStage);
         this.var_2634 = stage.quality;
         stage.quality = StageQuality.MEDIUM;
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_2574);
      }
      
      private function method_2574(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.method_2574);
         stage.quality = this.var_2634;
      }
      
      public function setValue(param1:String) : void
      {
         this.var_2633.text = param1;
         this.var_2633.x = 120 - this.var_2633.width >> 1;
         this.var_2633.y = 100 - 5 - this.var_2633.height;
      }
   }
}
