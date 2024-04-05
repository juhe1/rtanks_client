package package_183
{
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import alternativa.tanks.gui.name_1853;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import forms.Alert;
   import forms.name_358;
   import package_1.Main;
   import package_12.name_24;
   import package_31.name_115;
   import package_385.class_127;
   import package_385.class_128;
   import package_4.ClientObject;
   import package_7.name_32;
   
   public class AntiAddictionAlertModel extends class_127 implements name_1034, class_128, class_11
   {
       
      
      private var dialogsLayer:DisplayObjectContainer;
      
      private var var_1126:name_1853;
      
      private var clientObject:ClientObject;
      
      public function AntiAddictionAlertModel()
      {
         super();
         var_365.push(name_66);
         var_365.push(class_128);
         var_365.push(name_1034);
         var_365.push(class_11);
         this.dialogsLayer = (Main.osgi.name_6(name_24) as name_24).dialogsLayer as DisplayObjectContainer;
      }
      
      public function method_1360(param1:ClientObject, param2:int) : void
      {
         Main.method_8("AA MODEL","show aaAlert clientObject = %1",param1);
         this.method_1359(param2);
      }
      
      public function method_513(param1:ClientObject, param2:Boolean) : void
      {
         var _loc3_:name_32 = Main.osgi.name_6(name_32) as name_32;
         var _loc4_:name_115 = _loc3_.getModelsByInterface(name_115)[0] as name_115;
         if(this.var_1126 != null && this.dialogsLayer.contains(this.var_1126))
         {
            if(!param2)
            {
               _loc4_.method_512("该身份证错误,请重新输入");
               this.var_1126.name_1856();
            }
            else
            {
               _loc4_.method_512("您的身份证信息已通过验证");
               _loc4_.unblur();
               this.dialogsLayer.removeChild(this.var_1126);
            }
         }
         else
         {
            _loc4_.method_513(param2);
         }
      }
      
      public function method_1355(param1:String, param2:String) : void
      {
      }
      
      private function method_1359(param1:int) : void
      {
         var _loc4_:String = null;
         var _loc5_:Alert = null;
         var _loc2_:name_32 = Main.osgi.name_6(name_32) as name_32;
         var _loc3_:name_115 = _loc2_.getModelsByInterface(name_115)[0] as name_115;
         if(param1 >= 210)
         {
            _loc3_.blur();
            if(this.var_1126 != null && this.dialogsLayer.contains(this.var_1126))
            {
               this.dialogsLayer.removeChild(this.var_1126);
            }
            this.var_1126 = new name_1853(param1);
            this.var_1126.addEventListener(Event.COMPLETE,this.method_1358);
            this.var_1126.addEventListener(Event.CANCEL,this.method_1357);
            this.dialogsLayer.addChild(this.var_1126);
            Main.stage.addEventListener(Event.RESIZE,this.method_1356);
            this.method_1356();
         }
         else
         {
            _loc4_ = "";
            if(param1 >= 180)
            {
               _loc4_ = "您累计在线时间已满3小时，请您下线休息，做适当身体活动。";
            }
            else if(param1 >= 120)
            {
               _loc4_ = "您累计在线时间已满2小时。";
            }
            else if(param1 >= 60)
            {
               _loc4_ = "您累计在线时间已满1小时。";
            }
            _loc5_ = new Alert();
            _loc5_.showAlert(_loc4_,[name_358.OK]);
            this.dialogsLayer.addChild(_loc5_);
         }
      }
      
      private function method_1358(param1:Event) : void
      {
         this.method_1355(this.var_1126.name_1855.value,this.var_1126.name_1854.value);
         this.var_1126.name_1857();
      }
      
      private function method_1357(param1:Event) : void
      {
         var _loc2_:name_32 = Main.osgi.name_6(name_32) as name_32;
         var _loc3_:name_115 = _loc2_.getModelsByInterface(name_115)[0] as name_115;
         _loc3_.unblur();
         this.dialogsLayer.removeChild(this.var_1126);
      }
      
      private function method_1356(param1:Event = null) : void
      {
         this.var_1126.x = Math.round((Main.stage.stageWidth - this.var_1126.name_1029.x) * 0.5);
         this.var_1126.y = Math.round((Main.stage.stageHeight - this.var_1126.name_1029.y) * 0.5);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         Main.method_8("AA MODEL","Loaded clientObject = %1",param1);
         this.clientObject = param1;
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         if(this.var_1126 != null && this.dialogsLayer.contains(this.var_1126))
         {
            this.dialogsLayer.removeChild(this.var_1126);
         }
      }
   }
}
