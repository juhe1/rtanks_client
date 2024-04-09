package package_16
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.name_25;
   import flash.utils.Dictionary;
   
   public class LoadingProgress
   {
       
      
      private var listeners:Vector.<ILoadingProgressListener>;
      
      private var var_202:Dictionary;
      
      public function LoadingProgress()
      {
         super();
         this.listeners = new Vector.<ILoadingProgressListener>();
         this.var_202 = new Dictionary();
      }
      
      public function addEventListener(param1:ILoadingProgressListener) : void
      {
         this.listeners.push(param1);
      }
      
      public function removeEventListener(param1:ILoadingProgressListener) : void
      {
         this.listeners.splice(this.listeners.indexOf(param1),1);
      }
      
      public function method_285(param1:Object) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.listeners.length)
         {
            ILoadingProgressListener(this.listeners[_loc2_]).processStarted(param1);
            _loc2_++;
         }
      }
      
      public function method_286(param1:Object) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.listeners.length)
         {
            ILoadingProgressListener(this.listeners[_loc2_]).processStoped(param1);
            _loc2_++;
         }
      }
      
      public function setStatus(param1:Object, param2:String) : void
      {
         (OSGi.osgi.getService(name_25) as name_25).name_848("LOADING PROGRESS","setStatus: %1 (processId: %2)",param2,param1);
         if(this.var_202[param1] == null)
         {
            this.var_202[param1] = new name_847(param2,0);
         }
         else
         {
            name_847(this.var_202[param1]).status = param2;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.listeners.length)
         {
            ILoadingProgressListener(this.listeners[_loc3_]).changeStatus(param1,param2);
            _loc3_++;
         }
      }
      
      public function method_284(param1:Object, param2:Number) : void
      {
         (OSGi.osgi.getService(name_25) as name_25).name_848("LOADING PROGRESS","setProgress: %1 (processId: %2)",param2,param1);
         if(param2 < 0)
         {
            param2 = 0;
         }
         if(param2 > 1)
         {
            param2 = 1;
         }
         if(this.var_202[param1] == null)
         {
            if(param2 != 1)
            {
               this.var_202[param1] = new name_847("",param2);
            }
         }
         else if(param2 != 1)
         {
            name_847(this.var_202[param1]).progress = param2;
         }
         else
         {
            this.var_202[param1] = null;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.listeners.length)
         {
            ILoadingProgressListener(this.listeners[_loc3_]).changeProgress(param1,param2);
            _loc3_++;
         }
      }
      
      public function getStatus(param1:Object) : String
      {
         return this.var_202[param1] != null ? name_847(this.var_202[param1]).status : "";
      }
      
      public function method_287(param1:Object) : Number
      {
         return this.var_202[param1] != null ? name_847(this.var_202[param1]).progress : 0;
      }
   }
}
