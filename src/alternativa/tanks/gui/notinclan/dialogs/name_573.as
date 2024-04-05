package alternativa.tanks.gui.notinclan.dialogs
{
   import alternativa.tanks.gui.clanmanagement.ClanActionsManager;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.class_138;
   import controls.base.name_998;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.name_1838;
   import package_25.name_52;
   import package_26.name_62;
   import package_379.class_123;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_573 extends class_123 implements class_138
   {
      
      public static var clanService:name_62;
      
      public static var clanUserInfoService:name_52;
      
      public static var localeService:name_102;
      
      public static const const_422:Number = 11;
      
      public static const const_1535:Number = 7;
       
      
      protected var name_983:name_998;
      
      protected var window:name_1838;
      
      private var _width:Number;
      
      private var _height:Number;
      
      public function name_573()
      {
         super();
         ClanActionsManager.name_1931(this);
         this.window = name_1838.name_1844(localeService.getText(this.method_1477()));
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.name_983 = new name_998();
         this.name_983.label = localeService.getText(name_390.const_1168);
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_1475);
         addChild(this.window);
         addChild(this.name_983);
         this.window.width = this.width;
         this.window.height = this.height;
         this.name_983.x = this.width - this.name_983.width - 11;
         this.name_983.y = this.height - this.name_983.height - 11;
         var_864.name_1001(this);
      }
      
      protected function method_1477() : String
      {
         return "";
      }
      
      protected function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      protected function method_1475(param1:MouseEvent) : void
      {
         display.stage.focus = null;
         this.destroy();
      }
      
      public function destroy() : void
      {
         ClanActionsManager.name_1937(this);
         var_864.name_1013(this);
         this.method_1476();
      }
      
      protected function method_1476() : void
      {
      }
      
      override public function get width() : Number
      {
         return 0;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
      }
      
      override public function get height() : Number
      {
         return 0;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
      }
      
      public function method_1459() : void
      {
      }
      
      override public function method_1307() : void
      {
         display.stage.focus = null;
         this.destroy();
      }
   }
}
