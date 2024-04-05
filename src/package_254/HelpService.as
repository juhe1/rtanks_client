package package_254
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.name_25;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.SharedObject;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import package_1.TanksServicesActivator;
   import package_12.name_24;
   import package_95.name_298;
   
   public class HelpService implements name_791
   {
       
      
      private var osgi:OSGi;
      
      private var storage:SharedObject;
      
      private var stage:Stage;
      
      private var var_1479:DisplayObjectContainer;
      
      private var var_1477:Sprite;
      
      private var var_1481:Dictionary;
      
      private var var_1480:Array;
      
      private var var_1482:Boolean;
      
      private var var_1478:Array;
      
      private var lock:Boolean;
      
      public function HelpService()
      {
         super();
         this.osgi = TanksServicesActivator.osgi;
         var _loc1_:name_24 = this.osgi.name_6(name_24) as name_24;
         this.stage = _loc1_.stage;
         this.var_1479 = _loc1_.noticesLayer;
         this.var_1477 = new Sprite();
         this.var_1481 = new Dictionary();
         this.var_1480 = new Array();
         this.var_1478 = new Array();
         this.storage = name_298(this.osgi.name_6(name_298)).getStorage();
         if(this.storage.data.helperShowNum == null)
         {
            this.storage.data.helperShowNum = new Dictionary();
         }
         this.var_1482 = this.storage.data.userRank != null && this.storage.data.userRank >= 6;
         (this.osgi.name_6(name_25) as name_25).name_848("HELP","advancedUser: %1",this.var_1482);
         this.stage.addEventListener(Event.RESIZE,this.method_161);
      }
      
      public function name_981(param1:String, param2:int, param3:class_37, param4:Boolean) : void
      {
         var _loc5_:name_25 = name_25(this.osgi.name_6(name_25));
         _loc5_.name_848("HELP","\nregisterHelper");
         _loc5_.name_848("HELP","   groupKey: %1",param1);
         _loc5_.name_848("HELP","   helperId: %1",param2);
         _loc5_.name_848("HELP","   helper: %1",param3);
         var _loc6_:Dictionary = this.var_1481[param1];
         if(_loc6_ == null)
         {
            _loc6_ = new Dictionary();
            this.var_1481[param1] = _loc6_;
         }
         _loc6_[param2] = param3;
         if(param4)
         {
            this.var_1480.push(param3);
         }
         var _loc7_:Dictionary = this.storage.data.helperShowNum as Dictionary;
         if(_loc7_ == null)
         {
            _loc7_ = new Dictionary();
         }
         if(_loc7_[param1] == null)
         {
            _loc7_[param1] = new Array();
         }
         if(_loc7_[param1][param2] == null)
         {
            _loc7_[param1][param2] = param3.showNum;
         }
         else
         {
            param3.showNum = _loc7_[param1][param2];
         }
         param3.id = param2;
         param3.groupKey = param1;
      }
      
      public function name_987(param1:String, param2:int) : void
      {
         var _loc3_:name_25 = name_25(this.osgi.name_6(name_25));
         _loc3_.name_848("HELP","\nunregisterHelper");
         _loc3_.name_848("HELP","   groupKey: %1",param1);
         _loc3_.name_848("HELP","   helperId: %1",param2);
         var _loc4_:Dictionary = this.var_1481[param1];
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:class_37 = _loc4_[param2];
         if(_loc5_ == null)
         {
            return;
         }
         _loc3_.name_848("HELP","   helper: %1",_loc5_);
         this.method_1684(_loc5_);
         delete _loc4_[param2];
         var _loc6_:int = this.var_1480.indexOf(_loc5_);
         if(_loc6_ != -1)
         {
            this.var_1480.splice(_loc6_,1);
         }
      }
      
      public function name_1654(param1:String, param2:int, param3:Boolean = false) : void
      {
         var _loc4_:class_37 = null;
         var _loc5_:Vector.<Object> = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:name_1305 = null;
         (this.osgi.name_6(name_25) as name_25).name_848("HELP","showHelper groupKey: %1, helperId: %2, advancedUser: %3",param1,param2,this.var_1482);
         if(!this.var_1482)
         {
            _loc4_ = this.method_1683(param1,param2);
            if(_loc4_ == null)
            {
               return;
            }
            if(!this.var_1479.contains(this.var_1477))
            {
               this.var_1479.addChild(this.var_1477);
            }
            if(_loc4_.method_824 == -1 || _loc4_.method_824 != -1 && _loc4_.showNum < _loc4_.method_824)
            {
               if(!this.var_1477.contains(_loc4_))
               {
                  _loc4_.showNum += 1;
                  _loc5_ = this.storage.data.helperShowNum != null && this.storage.data.helperShowNum is Vector.<Object> ? this.storage.data.helperShowNum : new Vector.<Object>();
                  _loc6_ = -1;
                  _loc7_ = 0;
                  while(_loc7_ < _loc5_.length)
                  {
                     if(_loc5_[_loc7_].hasOwnProperty("groupKey") && _loc5_[_loc7_].groupKey == param1)
                     {
                        _loc6_ = _loc7_;
                     }
                     _loc7_++;
                  }
                  if(_loc6_ == -1)
                  {
                     _loc8_ = new Object();
                     _loc8_.groupKey = param1;
                     _loc8_.helper = new Array();
                     _loc8_.helper[param2] = _loc4_.showNum;
                     _loc5_.push(_loc8_);
                  }
                  else
                  {
                     _loc5_[_loc6_].helper[param2] = _loc4_.showNum;
                  }
                  this.storage.data.helperShowNum = _loc5_;
                  this.var_1477.addChild(_loc4_);
                  _loc4_.draw(_loc4_.size);
                  _loc4_.align(this.stage.stageWidth,this.stage.stageHeight);
                  _loc4_.addEventListener(MouseEvent.MOUSE_DOWN,this.onHelperClick);
                  if(param3)
                  {
                     _loc9_ = new name_1305(_loc4_.var_602,1);
                     _loc9_.helper = _loc4_;
                     _loc4_.timer = _loc9_;
                     _loc9_.addEventListener(TimerEvent.TIMER_COMPLETE,this.onHelperTimer);
                     this.var_1478.push(_loc9_);
                     _loc9_.reset();
                     _loc9_.start();
                  }
               }
            }
         }
      }
      
      public function name_1653(param1:String, param2:int) : void
      {
         (this.osgi.name_6(name_25) as name_25).name_848("HELP","hideHelper groupKey: %1, helperId: %2",param1,param2);
         if(!this.var_1482)
         {
            this.method_1684(this.method_1683(param1,param2));
         }
      }
      
      public function showHelp() : void
      {
         var _loc1_:int = 0;
         var _loc2_:class_37 = null;
         var _loc3_:int = 0;
         if(!this.lock)
         {
            (this.osgi.name_6(name_25) as name_25).name_848("HELP","showHelp");
            if(!this.var_1479.contains(this.var_1477))
            {
               this.var_1479.addChild(this.var_1477);
            }
            _loc1_ = 0;
            while(_loc1_ < this.var_1480.length)
            {
               _loc2_ = this.var_1480[_loc1_] as class_37;
               if(!this.var_1477.contains(_loc2_))
               {
                  this.var_1477.addChild(_loc2_);
                  _loc2_.draw(_loc2_.size);
                  _loc2_.align(this.stage.stageWidth,this.stage.stageHeight);
               }
               else
               {
                  _loc3_ = this.var_1478.indexOf(_loc2_.timer);
                  if(_loc3_ != -1)
                  {
                     (this.osgi.name_6(name_25) as name_25).name_848("HELP","   helper %1 %2 timer stop",_loc2_.groupKey,_loc2_.id);
                     (this.var_1478[_loc3_] as name_1305).stop();
                     this.var_1478.splice(_loc3_,1);
                  }
               }
               _loc1_++;
            }
            this.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         }
      }
      
      public function hideHelp() : void
      {
         var _loc2_:class_37 = null;
         var _loc3_:int = 0;
         (this.osgi.name_6(name_25) as name_25).name_848("HELP","hideHelp");
         var _loc1_:int = 0;
         while(_loc1_ < this.var_1480.length)
         {
            _loc2_ = this.var_1480[_loc1_];
            _loc3_ = this.var_1478.indexOf(_loc2_.timer);
            if(_loc3_ != -1)
            {
               (this.osgi.name_6(name_25) as name_25).name_848("HELP","   helper %1 %2 timer stop",_loc2_.groupKey,_loc2_.id);
               (this.var_1478[_loc3_] as name_1305).stop();
               this.var_1478.splice(_loc3_,1);
            }
            if(this.var_1477.contains(_loc2_))
            {
               this.var_1477.removeChild(_loc2_);
            }
            _loc1_++;
         }
         if(this.var_1477.numChildren == 0)
         {
            if(this.var_1479.contains(this.var_1477))
            {
               this.var_1479.removeChild(this.var_1477);
            }
            this.var_1477 = new Sprite();
         }
         this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      public function method_1682(param1:TextFormat) : void
      {
         name_2100.textFormat = param1;
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.hideHelp();
         this.lock = true;
         this.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.unlock);
      }
      
      private function unlock(param1:MouseEvent) : void
      {
         this.lock = false;
         this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.unlock);
      }
      
      private function onHelperTimer(param1:TimerEvent) : void
      {
         (this.osgi.name_6(name_25) as name_25).name_848("HELP","onHelperTimer");
         var _loc2_:name_1305 = param1.target as name_1305;
         var _loc3_:class_37 = _loc2_.helper;
         (this.osgi.name_6(name_25) as name_25).name_848("HELP","   helper.groupKey: %1",_loc3_.groupKey);
         (this.osgi.name_6(name_25) as name_25).name_848("HELP","   helper.id: %1",_loc3_.id);
         this.name_1653(_loc3_.groupKey,_loc3_.id);
      }
      
      private function onHelperClick(param1:MouseEvent) : void
      {
         var _loc2_:class_37 = null;
         (this.osgi.name_6(name_25) as name_25).name_848("HELP","onHelperClick");
         if(param1.target is class_37)
         {
            _loc2_ = param1.target as class_37;
            (this.osgi.name_6(name_25) as name_25).name_848("HELP","   helper.groupKey: %1",_loc2_.groupKey);
            (this.osgi.name_6(name_25) as name_25).name_848("HELP","   helper.id: %1",_loc2_.id);
            this.name_1653(_loc2_.groupKey,_loc2_.id);
         }
      }
      
      private function method_161(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:class_37 = null;
         if(this.var_1479.contains(this.var_1477))
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_1477.numChildren)
            {
               _loc3_ = this.var_1477.getChildAt(_loc2_) as class_37;
               if(_loc3_ != null)
               {
                  _loc3_.align(this.stage.stageWidth,this.stage.stageHeight);
               }
               _loc2_++;
            }
         }
      }
      
      private function method_1683(param1:String, param2:int) : class_37
      {
         var _loc3_:Dictionary = this.var_1481[param1];
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_[param2];
      }
      
      private function method_1684(param1:class_37) : void
      {
         var _loc3_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(this.var_1477.contains(param1))
         {
            this.var_1477.removeChild(param1);
         }
         param1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onHelperClick);
         var _loc2_:name_1305 = param1.timer;
         if(_loc2_ != null)
         {
            _loc2_.stop();
            _loc3_ = this.var_1478.indexOf(_loc2_);
            if(_loc3_ != -1)
            {
               this.var_1478.splice(_loc3_,1);
            }
         }
      }
   }
}
