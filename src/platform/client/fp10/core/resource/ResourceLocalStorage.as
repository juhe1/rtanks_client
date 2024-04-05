package platform.client.fp10.core.resource
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.name_25;
   import alternativa.osgi.service.console.name_27;
   import flash.events.NetStatusEvent;
   import flash.net.SharedObject;
   import flash.net.SharedObjectFlushStatus;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   import package_13.Long;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.errormessage.errors.SharedObjectUsNotAccessibleError;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   
   public class ResourceLocalStorage implements IResourceLocalStorage, IResourceLocalStorageInternal
   {
       
      
      private var _enabled:Boolean;
      
      private var soStorage:SharedObject;
      
      private var resourceIndex:ResourceIndex;
      
      private var temporaryStorageState:Boolean;
      
      private var consoleCommands:Object;
      
      public function ResourceLocalStorage(param1:OSGi)
      {
         super();
         this.soStorage = SharedObject.getLocal("localstorage","/");
         this.resourceIndex = new ResourceIndex(this.soStorage);
         this.enableStorage(true);
         this.initConsoleCommands(param1);
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(param1)
         {
            this.enableStorage(false);
         }
         else
         {
            this.temporaryStorageState = false;
            this.setEnabledInternal(false);
         }
      }
      
      public function getResourceData(param1:Long, param2:int, param3:String) : ByteArray
      {
         var _loc4_:ResourceObject = new ResourceObject(param1.toString(),param3);
         if(_loc4_.resourceVersion == param2)
         {
            return _loc4_.data;
         }
         this.resourceIndex.removeResourceData(_loc4_.resourceId,param3);
         _loc4_.clear();
         return null;
      }
      
      public function setResourceData(param1:Long, param2:int, param3:ByteArray, param4:String, param5:String) : void
      {
         param5 ||= Resource.DEFAULT_CLASSIFIER;
         var _loc6_:ResourceObject = new ResourceObject(param1.toString(),param5);
         _loc6_.resourceVersion = param2;
         _loc6_.data = param3;
         _loc6_.flush();
         this.resourceIndex.addResourceData(_loc6_.resourceId,param5,param4);
      }
      
      public function clearResourceData(param1:Long) : void
      {
         this.clearResourceDataStr(param1.toString());
      }
      
      public function clear() : void
      {
         var _loc1_:String = null;
         var _loc2_:Vector.<String> = this.resourceIndex.getResourceIds();
         for each(_loc1_ in _loc2_)
         {
            this.clearResourceDataStr(_loc1_);
         }
      }
      
      public function flushIndex() : void
      {
         this.soStorage.flush();
      }
      
      public function clearResourceDataStr(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:ResourceObject = null;
         var _loc4_:ResourceInfo = this.resourceIndex.getResourceInfo(param1);
         if(_loc4_.empty)
         {
            return;
         }
         for each(_loc2_ in _loc4_.classifiers)
         {
            _loc3_ = new ResourceObject(param1,_loc2_);
            _loc3_.clear();
         }
         this.resourceIndex.removeResourceInfo(param1);
      }
      
      public function getResourceIndex() : ResourceIndex
      {
         return this.resourceIndex;
      }
      
      private function enableStorage(param1:Boolean) : void
      {
         var errorType:SharedObjectUsNotAccessibleError = null;
         var messageBoxService:IErrorMessageService = null;
         var flushStatus:String = null;
         errorType = null;
         messageBoxService = null;
         var temporary:Boolean = param1;
         this.temporaryStorageState = temporary;
         try
         {
            flushStatus = this.soStorage.flush(100 * (1 << 20));
         }
         catch(e:Error)
         {
            errorType = new SharedObjectUsNotAccessibleError();
            trace(errorType.getMessage());
            messageBoxService = IErrorMessageService(OSGi.getInstance().name_6(IErrorMessageService));
            messageBoxService.showMessage(errorType);
         }
         switch(flushStatus)
         {
            case SharedObjectFlushStatus.FLUSHED:
               this.setEnabledInternal(true);
               break;
            case SharedObjectFlushStatus.PENDING:
               this.soStorage.addEventListener(NetStatusEvent.NET_STATUS,this.onNetStatus);
         }
      }
      
      private function onNetStatus(param1:NetStatusEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.soStorage.removeEventListener(NetStatusEvent.NET_STATUS,this.onNetStatus);
         if(param1.info.code == "SharedObject.Flush.Failed")
         {
            _loc2_ = Capabilities.os.indexOf("Windows");
            _loc3_ = Capabilities.os.indexOf("Linux");
            _loc4_ = Capabilities.os.indexOf("Mac");
            if(_loc2_ >= 0 || (_loc3_ >= 0 || _loc4_ >= 0) && this.soStorage.flush(100 * (1 << 20)) == SharedObjectFlushStatus.PENDING)
            {
               this.setEnabledInternal(false);
            }
            else
            {
               this.setEnabledInternal(true);
            }
         }
         else
         {
            this.setEnabledInternal(true);
         }
      }
      
      private function setEnabledInternal(param1:Boolean) : void
      {
         if(!this.temporaryStorageState)
         {
            this.soStorage.data.enabled = param1;
         }
         this._enabled = param1;
      }
      
      private function initConsoleCommands(param1:OSGi) : void
      {
         var _loc2_:name_27 = name_27(param1.name_6(name_27));
         _loc2_.method_211("locstor",this.onConsoleCommand);
         this.consoleCommands = {};
         this.addConsoleCommand(new PrintIndexCommand("ls",this));
         this.addConsoleCommand(new DeleteResourceCommand("del",this));
         this.addConsoleCommand(new ClearStorageCommand("clear",this));
         this.addConsoleCommand(new StatusCommand("status",this));
         this.addConsoleCommand(new EnableStorageCommand("enable",this));
         this.addConsoleCommand(new DisableStorageCommand("disable",this));
         this.addConsoleCommand(new FlushStorageIndexCommand("flush",this));
      }
      
      private function addConsoleCommand(param1:ConsoleCommand) : void
      {
         this.consoleCommands[param1.name] = param1;
      }
      
      private function onConsoleCommand(param1:name_25, param2:Array) : void
      {
         var _loc3_:Array = null;
         var _loc4_:* = null;
         var _loc5_:ConsoleCommand = this.consoleCommands[param2.shift()];
         if(_loc5_ == null)
         {
            _loc3_ = [];
            for(_loc4_ in this.consoleCommands)
            {
               _loc3_.push(_loc4_);
            }
            _loc3_.sort();
            for each(_loc4_ in _loc3_)
            {
            }
            return;
         }
         _loc5_.execute(param1,param2);
      }
   }
}

import flash.net.SharedObject;
import flash.utils.ByteArray;

class ResourceObject
{
    
   
   private var sharedObject:SharedObject;
   
   private var _resourceId:String;
   
   public function ResourceObject(param1:String, param2:String)
   {
      super();
      var _loc3_:String = param1 + "-" + param2;
      this.sharedObject = SharedObject.getLocal(_loc3_,"/");
      this._resourceId = param1;
   }
   
   public function get resourceId() : String
   {
      return this._resourceId;
   }
   
   public function get resourceVersion() : int
   {
      return this.sharedObject.data.version;
   }
   
   public function set resourceVersion(param1:int) : void
   {
      this.sharedObject.data.version = param1;
   }
   
   public function get data() : ByteArray
   {
      return this.sharedObject.data.data;
   }
   
   public function set data(param1:ByteArray) : void
   {
      this.sharedObject.data.data = param1;
   }
   
   public function flush() : void
   {
      this.sharedObject.flush();
   }
   
   public function clear() : void
   {
      this.sharedObject.clear();
   }
}

import flash.net.SharedObject;

class ResourceIndex
{
    
   
   private var sharedObject:SharedObject;
   
   private var index:Object;
   
   public function ResourceIndex(param1:SharedObject)
   {
      super();
      this.sharedObject = param1;
      this.index = param1.data.index;
      if(this.index == null)
      {
         this.index = {};
         param1.data.index = this.index;
      }
   }
   
   public function getResourceInfo(param1:String) : ResourceInfo
   {
      return new ResourceInfo(this.index[param1]);
   }
   
   public function setResourceInfo(param1:String, param2:ResourceInfo) : void
   {
      if(param2 == null)
      {
         this.removeResourceInfo(param1);
      }
      else
      {
         this.index[param1] = param2.rawData;
      }
   }
   
   public function removeResourceInfo(param1:String) : void
   {
      delete this.index[param1];
   }
   
   public function addResourceData(param1:String, param2:String, param3:String) : void
   {
      var _loc4_:ResourceInfo = this.getResourceInfo(param1);
      _loc4_.description = param3;
      var _loc5_:Array = _loc4_.classifiers;
      if(_loc5_.indexOf(param2) < 0)
      {
         _loc5_.push(param2);
      }
      this.setResourceInfo(param1,_loc4_);
   }
   
   public function removeResourceData(param1:String, param2:String) : void
   {
      var _loc3_:ResourceInfo = this.getResourceInfo(param1);
      if(_loc3_.empty)
      {
         return;
      }
      var _loc4_:Array = _loc3_.classifiers;
      var _loc5_:int = _loc4_.indexOf(param2);
      if(_loc5_ >= 0)
      {
         if(_loc4_.length == 1)
         {
            this.removeResourceInfo(param1);
         }
         else
         {
            _loc4_.splice(_loc5_,1);
            this.setResourceInfo(param1,_loc3_);
         }
      }
   }
   
   public function getResourceIds() : Vector.<String>
   {
      var _loc1_:* = null;
      var _loc2_:Vector.<String> = new Vector.<String>();
      for(_loc1_ in this.index)
      {
         _loc2_.push(_loc1_);
      }
      return _loc2_;
   }
}

import alternativa.osgi.service.console.name_25;
import platform.client.fp10.core.resource.ResourceLocalStorage;

class ConsoleCommand
{
    
   
   public var name:String;
   
   public var description:String;
   
   protected var storage:ResourceLocalStorage;
   
   public function ConsoleCommand(param1:String, param2:ResourceLocalStorage)
   {
      super();
      this.name = param1;
      this.storage = param2;
   }
   
   public function execute(param1:name_25, param2:Array) : void
   {
   }
}

import alternativa.osgi.service.console.name_25;
import platform.client.fp10.core.resource.ResourceLocalStorage;

class PrintIndexCommand extends ConsoleCommand
{
    
   
   public function PrintIndexCommand(param1:String, param2:ResourceLocalStorage)
   {
      super(param1,param2);
      description = param1 + " -- lists all locally stored resources";
   }
   
   override public function execute(param1:name_25, param2:Array) : void
   {
      var counter:int = 0;
      var sid:String = null;
      var resourceInfo:ResourceInfo = null;
      var console:name_25 = param1;
      var params:Array = param2;
      var resourceIndex:ResourceIndex = storage.getResourceIndex();
      var resourceIds:Vector.<String> = resourceIndex.getResourceIds();
      resourceIds.sort(function(param1:String, param2:String):Number
      {
         if(param1 < param2)
         {
            return -1;
         }
         if(param1 > param2)
         {
            return 1;
         }
         return 0;
      });
      for each(var _loc6_ in resourceIds)
      {
         sid = _loc6_;
         _loc6_;
         resourceInfo = resourceIndex.getResourceInfo(sid);
      }
   }
}

import alternativa.osgi.service.console.name_25;
import platform.client.fp10.core.resource.ResourceLocalStorage;

class DeleteResourceCommand extends ConsoleCommand
{
    
   
   public function DeleteResourceCommand(param1:String, param2:ResourceLocalStorage)
   {
      super(param1,param2);
      description = param1 + " resource_id -- removes locally stored resource with given id";
   }
   
   override public function execute(param1:name_25, param2:Array) : void
   {
      var _loc3_:String = String(param2[0]);
      if(!_loc3_)
      {
         return;
      }
      storage.clearResourceDataStr(_loc3_);
   }
}

import alternativa.osgi.service.console.name_25;
import platform.client.fp10.core.resource.ResourceLocalStorage;

class ClearStorageCommand extends ConsoleCommand
{
    
   
   public function ClearStorageCommand(param1:String, param2:ResourceLocalStorage)
   {
      super(param1,param2);
      description = param1 + " -- wipes out all locally stored resources";
   }
   
   override public function execute(param1:name_25, param2:Array) : void
   {
      storage.clear();
   }
}

import alternativa.osgi.service.console.name_25;
import platform.client.fp10.core.resource.ResourceLocalStorage;

class StatusCommand extends ConsoleCommand
{
    
   
   public function StatusCommand(param1:String, param2:ResourceLocalStorage)
   {
      super(param1,param2);
      description = param1 + " -- prints local storage status";
   }
   
   override public function execute(param1:name_25, param2:Array) : void
   {
   }
}

import alternativa.osgi.service.console.name_25;
import platform.client.fp10.core.resource.ResourceLocalStorage;

class EnableStorageCommand extends ConsoleCommand
{
    
   
   public function EnableStorageCommand(param1:String, param2:ResourceLocalStorage)
   {
      super(param1,param2);
      description = param1 + " -- enables local storage";
   }
   
   override public function execute(param1:name_25, param2:Array) : void
   {
      storage.enabled = true;
      true;
   }
}

import alternativa.osgi.service.console.name_25;
import platform.client.fp10.core.resource.ResourceLocalStorage;

class DisableStorageCommand extends ConsoleCommand
{
    
   
   public function DisableStorageCommand(param1:String, param2:ResourceLocalStorage)
   {
      super(param1,param2);
      description = param1 + " -- disables local storage";
   }
   
   override public function execute(param1:name_25, param2:Array) : void
   {
      storage.enabled = false;
      false;
   }
}

import alternativa.osgi.service.console.name_25;
import platform.client.fp10.core.resource.ResourceLocalStorage;

class FlushStorageIndexCommand extends ConsoleCommand
{
    
   
   public function FlushStorageIndexCommand(param1:String, param2:ResourceLocalStorage)
   {
      super(param1,param2);
      description = param1 + " -- writes storage index to disk";
   }
   
   override public function execute(param1:name_25, param2:Array) : void
   {
      storage.flushIndex();
   }
}

class ResourceInfo
{
    
   
   public var empty:Boolean;
   
   public var rawData:Object;
   
   public function ResourceInfo(param1:Object)
   {
      super();
      if(param1 == null)
      {
         this.empty = true;
         this.rawData = {};
      }
      else
      {
         this.rawData = param1;
      }
   }
   
   public function get description() : String
   {
      return this.rawData.description;
   }
   
   public function set description(param1:String) : void
   {
      this.rawData.description = param1;
   }
   
   public function get classifiers() : Array
   {
      var _loc1_:Array = this.rawData.classifiers;
      if(_loc1_ == null)
      {
         _loc1_ = [];
         this.rawData.classifiers = _loc1_;
      }
      return _loc1_;
   }
}
