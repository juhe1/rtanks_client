package package_182
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.tanks.gui.ConfugirationsNewbiesWindow;
   import alternativa.tanks.gui.CongratulationsWindowPresent;
   import alternativa.tanks.gui.CongratulationsWindowWithBanner;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_1.Main;
   import package_13.Long;
   import package_31.name_115;
   import package_327.class_126;
   import package_327.name_1587;
   import package_4.ClientObject;
   import package_54.name_102;
   import package_60.TextConst;
   import package_7.name_32;
   
   public class BonusModel extends class_126 implements name_1587, class_11, name_659
   {
       
      
      private var clientObject:ClientObject;
      
      private var panelModel:name_115;
      
      private var dialogsLayer:DisplayObjectContainer;
      
      private var var_1123:CongratulationsWindowWithBanner;
      
      private var var_1122:CongratulationsWindowPresent;
      
      private var var_1124:Sprite;
      
      public function BonusModel()
      {
         super();
         _interfaces.push(IModel,name_659,name_1587,class_11);
         this.dialogsLayer = Main.dialogsLayer;
         var _loc1_:name_32 = Main.osgi.getService(name_32) as name_32;
         this.panelModel = (_loc1_.getModelsByInterface(name_115) as Vector.<IModel>)[0] as name_115;
      }
      
      public function name_437(param1:ClientObject, param2:Array, param3:String) : void
      {
         if(param2.length > 0)
         {
            this.panelModel.blur();
            this.var_1123 = new CongratulationsWindowWithBanner(name_102(Main.osgi.getService(name_102)).getText(TextConst.const_278),param2,null);
            this.dialogsLayer.addChild(this.var_1123);
            this.var_1123.name_983.addEventListener(MouseEvent.CLICK,this.method_1145);
            this.method_1080();
            Main.stage.addEventListener(Event.RESIZE,this.method_1080);
         }
      }
      
      public function name_1590(param1:ClientObject, param2:int, param3:Long) : void
      {
         this.panelModel.blur();
         this.var_1122 = new CongratulationsWindowPresent(CongratulationsWindowPresent.CRYSTALS,null,param2);
         this.dialogsLayer.addChild(this.var_1122);
         this.var_1122.name_983.addEventListener(MouseEvent.CLICK,this.method_1351);
         this.method_1349();
         Main.stage.addEventListener(Event.RESIZE,this.method_1349);
      }
      
      public function name_459(param1:ClientObject, param2:Long) : void
      {
         this.panelModel.blur();
         this.var_1122 = new CongratulationsWindowPresent(CongratulationsWindowPresent.name_1849,null);
         this.dialogsLayer.addChild(this.var_1122);
         this.var_1122.name_983.addEventListener(MouseEvent.CLICK,this.method_1351);
         this.method_1349();
         Main.stage.addEventListener(Event.RESIZE,this.method_1349);
      }
      
      public function name_430(param1:ClientObject, param2:Long) : void
      {
         this.panelModel.blur();
         this.var_1122 = new CongratulationsWindowPresent(CongratulationsWindowPresent.name_1850,null);
         this.dialogsLayer.addChild(this.var_1122);
         this.var_1122.name_983.addEventListener(MouseEvent.CLICK,this.method_1351);
         this.method_1349();
         Main.stage.addEventListener(Event.RESIZE,this.method_1349);
      }
      
      public function name_1588() : void
      {
         this.panelModel.blur();
         var _loc1_:ConfugirationsNewbiesWindow = new ConfugirationsNewbiesWindow(TextConst.const_275);
         this.var_1124 = _loc1_;
         this.dialogsLayer.addChild(_loc1_);
         _loc1_.name_983.addEventListener(MouseEvent.CLICK,this.method_1352);
         this.method_1350();
         Main.stage.addEventListener(Event.RESIZE,this.method_1350);
      }
      
      public function name_1589() : void
      {
         this.panelModel.blur();
         var _loc1_:ConfugirationsNewbiesWindow = new ConfugirationsNewbiesWindow(TextConst.const_244);
         this.var_1124 = _loc1_;
         this.dialogsLayer.addChild(_loc1_);
         _loc1_.name_983.addEventListener(MouseEvent.CLICK,this.method_1352);
         this.method_1350();
         Main.stage.addEventListener(Event.RESIZE,this.method_1350);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         this.clientObject = this.clientObject;
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         if(this.var_1123 != null && this.dialogsLayer.contains(this.var_1123))
         {
            this.method_1145();
            this.var_1123.name_983.removeEventListener(MouseEvent.CLICK,this.method_1145);
            Main.stage.removeEventListener(Event.RESIZE,this.method_1080);
            this.var_1123 = null;
         }
         this.clientObject = null;
      }
      
      public function get method_1348() : CongratulationsWindowWithBanner
      {
         return this.var_1123;
      }
      
      private function method_1350(param1:Event = null) : void
      {
         this.var_1124.x = Math.round((Main.stage.stageWidth - this.var_1124.width) * 0.5);
         this.var_1124.y = Math.round((Main.stage.stageHeight - this.var_1124.height) * 0.5);
      }
      
      private function method_1080(param1:Event = null) : void
      {
         this.var_1123.x = Math.round((Main.stage.stageWidth - this.var_1123.width) * 0.5);
         this.var_1123.y = Math.round((Main.stage.stageHeight - this.var_1123.height) * 0.5);
      }
      
      private function method_1349(param1:Event = null) : void
      {
         this.var_1122.x = Math.round((Main.stage.stageWidth - this.var_1122.width) * 0.5);
         this.var_1122.y = Math.round((Main.stage.stageHeight - this.var_1122.height) * 0.5);
      }
      
      private function method_1145(param1:MouseEvent = null) : void
      {
         this.panelModel.unblur();
         this.dialogsLayer.removeChild(this.var_1123);
      }
      
      private function method_1351(param1:MouseEvent = null) : void
      {
         this.panelModel.unblur();
         this.dialogsLayer.removeChild(this.var_1122);
      }
      
      private function method_1352(param1:MouseEvent = null) : void
      {
         this.panelModel.unblur();
         this.dialogsLayer.removeChild(this.var_1124);
      }
   }
}
