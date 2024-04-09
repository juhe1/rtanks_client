package package_484
{
   import alternativa.osgi.OSGi;
   import controls.base.DefaultButtonBase;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.name_1139;
   import package_177.IDialogsService;
   import package_340.name_1634;
   import package_379.class_123;
   import package_491.name_3686;
   import package_54.name_102;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   import utils.ScrollStyleUtils;
   
   public class ItemSkinsWindow extends class_123
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      public static var var_864:IDialogsService = OSGi.getInstance().getService(IDialogsService) as IDialogsService;
      
      private static const const_1518:int = 509;
      
      private static const const_1519:int = 450;
      
      private static const const_1939:int = 8;
      
      private static const const_2886:int = 12;
      
      private static const const_2885:int = 110;
       
      
      private var var_3715:name_3686;
      
      private var var_2632:Sprite;
      
      private var var_2630:ScrollPane;
      
      private var name_983:DefaultButtonBase;
      
      private var var_3716:Vector.<name_3685>;
      
      private var var_2861:Sprite;
      
      private var item:name_70;
      
      private var var_3717:Function;
      
      public function ItemSkinsWindow(param1:name_70, param2:Function)
      {
         this.var_3715 = new name_3686(509,450,24);
         this.var_2632 = new Sprite();
         this.var_2630 = new ScrollPane();
         this.name_983 = new DefaultButtonBase();
         this.var_3716 = new Vector.<name_3685>();
         this.var_2861 = new Sprite();
         super();
         this.item = param1;
         this.var_3717 = param2;
         this.method_1327();
         this.method_3309();
         this.method_1331();
         this.method_3310();
         this.var_2630.update();
         var_864.name_1001(this);
         this.method_2599(null);
      }
      
      private function method_1327() : void
      {
         this.var_3715.var_1182.showBlink = false;
         this.var_3715.window.method_2516(localeService.getText(name_390.const_1094));
         this.var_3715.name_1142(450);
         addChild(this.var_3715);
      }
      
      private function method_3309() : void
      {
         this.var_2630.y = 10;
         ScrollStyleUtils.setGreenStyle(this.var_2630);
         this.var_2630.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.var_2630.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.var_2630.source = this.var_2632;
         this.var_2630.focusEnabled = false;
         this.var_2630.setSize(509,450 - 20);
         this.var_3715.var_1182.addChild(this.var_2630);
      }
      
      private function method_1331() : void
      {
         this.name_983.label = localeService.getText(name_390.const_1276);
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_2555);
         this.var_3715.window.addChild(this.name_983);
      }
      
      private function method_3310() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Vector.<name_70> = name_1634(this.item.name_176(name_1634)).getSkins();
         var _loc3_:int = 6;
         _loc3_ += Math.max(this.method_3306(this.item,_loc3_).height,110) + 12;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc1_ = this.method_3306(_loc2_[_loc4_],_loc3_).height;
            _loc3_ += Math.max(_loc1_,110);
            _loc3_ += 12;
            _loc4_++;
         }
         this.method_3307(_loc3_);
      }
      
      private function method_3307(param1:int) : void
      {
         this.var_3715.name_1142(Math.min(param1 + 12,450));
         this.method_2690(param1);
         this.method_3308();
         var_864.method_1370(this);
      }
      
      private function method_2690(param1:int) : void
      {
         this.var_2861 = new Sprite();
         this.var_2632.addChild(this.var_2861);
         this.var_2861.graphics.lineStyle(1,name_1139.name_2012,0);
         this.var_2861.graphics.beginFill(name_1139.name_2012,0);
         this.var_2861.graphics.drawRect(0,0,1,15);
         this.var_2861.graphics.endFill();
         this.var_2861.x = 0;
         this.var_2861.y = param1;
      }
      
      private function method_3306(param1:name_70, param2:int) : name_3685
      {
         var _loc3_:name_3685 = new name_3685(this.item,param1);
         _loc3_.y = param2;
         this.var_2632.addChild(_loc3_);
         this.var_3716.push(_loc3_);
         _loc3_.addEventListener(Event.CHANGE,this.method_2599);
         return _loc3_;
      }
      
      private function method_2599(param1:Event) : void
      {
         var _loc2_:name_3685 = null;
         for each(_loc2_ in this.var_3716)
         {
            _loc2_.update();
         }
         if(param1 != null)
         {
            dispatchEvent(param1);
         }
      }
      
      private function method_3308() : void
      {
         this.name_983.y = this.var_3715.window.height - 5 - this.name_983.height - 8;
         this.name_983.x = this.var_3715.window.width - this.name_983.width - 12;
      }
      
      private function method_2555(param1:MouseEvent) : void
      {
         this.close();
      }
      
      override protected function method_1319() : void
      {
         this.close();
      }
      
      public function close() : void
      {
         var _loc1_:name_3685 = null;
         this.method_1476();
         for each(_loc1_ in this.var_3716)
         {
            _loc1_.destroy();
         }
         var_864.name_1013(this);
         this.var_3717();
      }
      
      protected function method_1476() : void
      {
         this.name_983.removeEventListener(MouseEvent.CLICK,this.method_2555);
      }
      
      override public function get width() : Number
      {
         return this.var_3715.window.width;
      }
      
      override public function get height() : Number
      {
         return this.var_3715.window.height;
      }
   }
}
