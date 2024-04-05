package alternativa.tanks.utils
{
   import package_486.URI;
   
   public class LinksInterceptor
   {
       
      
      private var var_3651:RegExp;
      
      private var var_3653:RegExp;
      
      private var var_3652:RegExp;
      
      private var var_3654:Vector.<String>;
      
      public var var_2193:Boolean = false;
      
      public function LinksInterceptor(param1:Vector.<String>)
      {
         this.var_3651 = /(https?:\/\/|www\.)((([\w-\.]+)\.([a-z]{2,6}\.?))|(([а-я-\.]+)\.(рф\.?)))(\/[\w\.]*)*\/?([^\s\n]+)?/gi;
         this.var_3653 = new RegExp(this.var_3651);
         this.var_3652 = /[\[\]\{\}\|\*\(\)\@\$\^\'`~+№!]/gi;
         super();
         this.var_3654 = param1;
      }
      
      public function name_3342(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:URI = null;
         this.var_3651.lastIndex = 0;
         var _loc4_:String = "";
         var _loc5_:Array = this.var_3651.exec(param1);
         var _loc6_:int = 0;
         this.var_2193 = false;
         while(_loc5_ != null)
         {
            _loc4_ += param1.substr(_loc6_,_loc5_.index - _loc6_);
            _loc2_ = param1.substr(_loc5_.index,this.var_3651.lastIndex - _loc5_.index);
            _loc3_ = this.method_3269(_loc2_);
            if(!this.method_3268(_loc3_) && _loc2_.indexOf("*") == -1)
            {
               _loc4_ += " <u><a href=\'event:" + _loc3_ + "\'>" + _loc2_ + "</a></u> ";
               this.var_2193 = true;
            }
            else
            {
               _loc4_ += _loc2_;
            }
            _loc6_ = this.var_3651.lastIndex;
            _loc5_ = this.var_3651.exec(param1);
         }
         return _loc4_ + param1.substr(this.var_3651.lastIndex == 0 ? Number(_loc6_) : Number(this.var_3651.lastIndex));
      }
      
      public function method_3270(param1:String) : Boolean
      {
         var _loc2_:URI = this.method_3269(param1);
         var _loc3_:String = _loc2_.authority;
         return this.var_3654.indexOf(_loc3_) != -1 && !this.method_3268(_loc2_);
      }
      
      private function method_3269(param1:String) : URI
      {
         return new URI(param1.search(/^https?:\/\//i) == -1 ? "http://" + param1 : param1);
      }
      
      private function method_3268(param1:URI) : Boolean
      {
         this.var_3653.lastIndex = 0;
         if(this.var_3653.exec(param1.queryRaw) != null)
         {
            return true;
         }
         this.var_3652.lastIndex = 0;
         if(this.var_3652.exec(param1.path) != null)
         {
            return true;
         }
         this.var_3652.lastIndex = 0;
         if(this.var_3652.exec(param1.fragment) != null)
         {
            return true;
         }
         return false;
      }
   }
}
