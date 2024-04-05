package alternativa.osgi.service.console
{
   import alternativa.osgi.service.command.class_16;
   import alternativa.osgi.service.command.name_43;
   import alternativa.osgi.service.logging.LogLevel;
   import alternativa.osgi.service.logging.class_17;
   import package_273.name_851;
   
   public class ConsoleLogTarget implements class_17
   {
      
      private static const ANY_CHANNEL:* = "ANY_CHANNEL";
      
      private static const const_54:LogLevel = null;
       
      
      private const const_53:Vector.<name_858> = new Vector.<name_858>(0);
      
      private const channels:Object = {};
      
      private var var_225:int;
      
      private var commandService:name_43;
      
      private var bufferSize:int;
      
      private var var_223:Object;
      
      private var var_224:Boolean;
      
      private var console:name_27;
      
      public function ConsoleLogTarget(param1:name_43, param2:name_27, param3:name_851)
      {
         this.var_223 = {};
         super();
         this.console = param2;
         this.commandService = param1;
         this.bufferSize = 1000;
         param1.name_822("log","channels","Список каналов",[],this.method_325);
         param1.name_822("log","channel","Показать сообщения из канала",[String],this.method_329);
         param1.name_822("log","connect","Показывать новые сообщения из канала",[String],this.method_330);
         param1.name_822("log","disconnect","Показывать новые сообщения из канала",[String],this.method_326);
         param1.name_822("log","trace","Посмотреть trace сообщения",[],this.method_322(LogLevel.TRACE));
         param1.name_822("log","info","Посмотреть info сообщения",[],this.method_322(LogLevel.INFO));
         param1.name_822("log","warning","Посмотреть warning сообщения",[],this.method_322(LogLevel.WARNING));
         param1.name_822("log","debug","Посмотреть debug сообщения",[],this.method_322(LogLevel.DEBUG));
         param1.name_822("log","error","Посмотреть error сообщения",[],this.method_322(LogLevel.ERROR));
      }
      
      public function log(param1:Object, param2:LogLevel, param3:String, param4:Array = null) : void
      {
         var _loc5_:name_858 = new name_858(this.var_225++,param1,param2,param3,param4);
         var _loc6_:Vector.<name_858> = this.method_328(param1);
         _loc6_.push(_loc5_);
         if(Boolean(this.var_223[param1]) || this.var_224)
         {
            this.print(this.console,_loc5_);
         }
         if(_loc6_.length > this.bufferSize)
         {
            _loc6_.splice(1,100);
         }
      }
      
      private function method_331(param1:name_851) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = String(param1.method_262("showlog"));
         if(Boolean(_loc3_))
         {
            if(_loc3_ == "*")
            {
               this.var_224 = true;
            }
            else
            {
               for each(_loc2_ in _loc3_.split(","))
               {
                  this.var_223[_loc2_] = true;
               }
            }
         }
      }
      
      private function method_326(param1:class_16, param2:String) : void
      {
         delete this.var_223[param2];
      }
      
      private function method_330(param1:class_16, param2:String) : void
      {
         this.var_223[param2] = param2;
      }
      
      private function method_322(param1:LogLevel) : Function
      {
         var logLevel:LogLevel = null;
         logLevel = null;
         logLevel = param1;
         return function(param1:class_16):void
         {
            var _loc2_:* = undefined;
            var _loc3_:* = getLogEntriesForLevel(logLevel);
            for each(_loc2_ in _loc3_)
            {
               print(param1,_loc2_);
            }
         };
      }
      
      private function getLogEntriesForLevel(param1:LogLevel) : Vector.<name_858>
      {
         var channelName:String = null;
         var channelEntries:Vector.<name_858> = null;
         var logEntry:name_858 = null;
         var logLevel:LogLevel = param1;
         var result:Vector.<name_858> = new Vector.<name_858>();
         for(channelName in this.channels)
         {
            channelEntries = this.channels[channelName];
            for each(logEntry in channelEntries)
            {
               if(logEntry.level == logLevel)
               {
                  result.push(logEntry);
               }
            }
         }
         result.sort(function(param1:name_858, param2:name_858):Number
         {
            return param1.name_859 - param2.name_859;
         });
         return result;
      }
      
      private function method_329(param1:class_16, param2:String) : void
      {
         var _loc3_:name_858 = null;
         var _loc4_:Vector.<name_858> = this.method_323(param2);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc3_ = _loc4_[_loc5_];
            if(this.method_327(_loc3_,param2,null))
            {
               this.print(param1,_loc3_);
            }
            _loc5_++;
         }
      }
      
      private function method_325(param1:class_16) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in this.channels)
         {
            param1.method_209(_loc2_);
         }
      }
      
      private function method_327(param1:name_858, param2:*, param3:LogLevel) : Boolean
      {
         if(param1.level != param3 && param3 != null)
         {
            return false;
         }
         if(param1.object != param2 && param2 != "ANY_CHANNEL")
         {
            return false;
         }
         return true;
      }
      
      private function method_324(param1:String, param2:Array) : String
      {
         var _loc3_:int = 0;
         if(param2 != null)
         {
            _loc3_ = 0;
            while(_loc3_ < param2.length)
            {
               param1 = param1.replace("%" + (_loc3_ + 1),param2[_loc3_]);
               _loc3_++;
            }
         }
         return param1;
      }
      
      private function print(param1:class_16, param2:name_858) : void
      {
         param1.method_209(param2.level.name_829() + " [" + param2.object + "] " + this.method_324(param2.message,param2.params));
      }
      
      private function method_328(param1:Object) : Vector.<name_858>
      {
         var _loc2_:Vector.<name_858> = this.method_323(param1);
         if(_loc2_ == this.const_53)
         {
            _loc2_ = new Vector.<name_858>();
            this.channels[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private function method_323(param1:Object) : Vector.<name_858>
      {
         return Boolean(this.channels[param1]) ? this.channels[param1] : this.const_53;
      }
   }
}
