package package_486
{
   public class URI
   {
      
      public static const const_2925:String = " %";
      
      public static const const_2915:String = " %" + ":?#/@";
      
      public static const const_2913:String = " %" + "?#";
      
      public static const const_2917:String = " %" + "#";
      
      public static const const_2916:String = " %" + "#&=";
      
      public static const const_2911:String = " %" + "?#/";
      
      public static const const_2926:String = "unknown";
      
      protected static const const_2908:name_3711 = new name_3711(const_2915);
      
      protected static const const_2920:name_3711 = const_2908;
      
      protected static const const_2912:name_3711 = const_2908;
      
      protected static const const_2921:name_3711 = const_2908;
      
      protected static const const_2923:name_3711 = const_2908;
      
      protected static const const_2918:name_3711 = new name_3711(const_2913);
      
      protected static const const_2909:name_3711 = new name_3711(const_2917);
      
      protected static const const_2919:name_3711 = new name_3711(const_2916);
      
      protected static const const_2910:name_3711 = const_2909;
      
      protected static const const_2914:name_3711 = new name_3711(const_2911);
      
      public static const const_2907:int = 0;
      
      public static const const_2924:int = 1;
      
      public static const EQUAL:int = 2;
      
      public static const const_2922:int = 3;
      
      protected static var var_3739:name_3712 = null;
       
      
      protected var var_2779:Boolean = false;
      
      protected var var_3740:Boolean = false;
      
      protected var var_3734:String = "";
      
      protected var var_3735:String = "";
      
      protected var var_3736:String = "";
      
      protected var name_3068:String = "";
      
      protected var var_3741:String = "";
      
      protected var var_229:String = "";
      
      protected var var_3737:String = "";
      
      protected var var_3742:String = "";
      
      protected var var_3738:String = "";
      
      public function URI(param1:String = null)
      {
         super();
         if(param1 == null)
         {
            this.name_3491();
         }
         else
         {
            this.method_3335(param1);
         }
      }
      
      public static function method_3333(param1:String) : String
      {
         return method_3318(param1,URI.const_2908);
      }
      
      public static function method_3319(param1:String) : String
      {
         return decodeURIComponent(param1);
      }
      
      public static function method_3318(param1:String, param2:name_3711) : String
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = "";
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc3_ = param1.charAt(_loc5_);
            _loc4_ = param2.name_3713(_loc3_);
            if(Boolean(_loc4_))
            {
               _loc3_ = _loc4_.toString(16);
               if(_loc3_.length == 1)
               {
                  _loc3_ = "0" + _loc3_;
               }
               _loc3_ = "%" + _loc3_;
               _loc3_ = _loc3_.toUpperCase();
            }
            _loc6_ += _loc3_;
            _loc5_++;
         }
         return _loc6_;
      }
      
      public static function method_3328(param1:String) : String
      {
         var _loc2_:String = param1;
         return URI.method_3318(param1,URI.const_2919);
      }
      
      public static function method_3326(param1:String) : String
      {
         var _loc2_:String = param1;
         return method_3319(_loc2_);
      }
      
      protected static function method_3321(param1:String, param2:String, param3:Boolean = true) : Boolean
      {
         if(param3 == false)
         {
            param1 = param1.toLowerCase();
            param2 = param2.toLowerCase();
         }
         return param1 == param2;
      }
      
      protected static function method_3327(param1:URI) : URI
      {
         var _loc2_:URI = new URI();
         _loc2_.method_3322(param1);
         if(var_3739 != null)
         {
            return var_3739.method_3327(_loc2_);
         }
         return _loc2_;
      }
      
      public static function set resolver(param1:name_3712) : void
      {
         var_3739 = param1;
      }
      
      public static function get resolver() : name_3712
      {
         return var_3739;
      }
      
      protected function method_3335(param1:String) : Boolean
      {
         if(!this.method_3343(param1))
         {
            this.var_2779 = false;
         }
         return this.name_940();
      }
      
      protected function name_3491() : void
      {
         this.var_2779 = false;
         this.var_3740 = false;
         this.var_3734 = "unknown";
         this.var_3735 = "";
         this.var_3736 = "";
         this.name_3068 = "";
         this.var_3741 = "";
         this.var_229 = "";
         this.var_3737 = "";
         this.var_3742 = "";
         this.var_3738 = "";
      }
      
      protected function set method_3320(param1:Boolean) : void
      {
         if(param1)
         {
            this.var_3738 = "";
            if(this.var_3734 == "" || this.var_3734 == "unknown")
            {
               this.var_3740 = true;
            }
            else
            {
               this.var_3740 = false;
            }
            if(this.var_3735.length == 0 && this.var_229.length == 0)
            {
               this.var_2779 = false;
            }
            else
            {
               this.var_2779 = true;
            }
         }
         else
         {
            this.var_3735 = "";
            this.var_3736 = "";
            this.name_3068 = "";
            this.var_3741 = "";
            this.var_229 = "";
            this.var_3740 = false;
            if(this.var_3734 == "" || this.var_3734 == "unknown")
            {
               this.var_2779 = false;
            }
            else
            {
               this.var_2779 = true;
            }
         }
      }
      
      protected function get method_3320() : Boolean
      {
         return this.var_3738.length == 0;
      }
      
      protected function method_3336() : Boolean
      {
         if(this.method_3324())
         {
            if(this.var_3734.length <= 1 || this.var_3734 == "unknown")
            {
               return false;
            }
            if(this.method_3341(this.var_3734) == false)
            {
               return false;
            }
         }
         if(this.method_3320)
         {
            if(this.var_229.search("\\") != -1)
            {
               return false;
            }
            if(this.method_3323() == false && this.var_3734 == "unknown")
            {
               return false;
            }
         }
         else if(this.var_3738.search("\\") != -1)
         {
            return false;
         }
         return true;
      }
      
      protected function method_3343(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = param1;
         this.name_3491();
         _loc2_ = _loc4_.indexOf("#");
         if(_loc2_ != -1)
         {
            if(_loc4_.length > _loc2_ + 1)
            {
               this.var_3742 = _loc4_.substr(_loc2_ + 1,_loc4_.length - (_loc2_ + 1));
            }
            _loc4_ = _loc4_.substr(0,_loc2_);
         }
         _loc2_ = _loc4_.indexOf("?");
         if(_loc2_ != -1)
         {
            if(_loc4_.length > _loc2_ + 1)
            {
               this.var_3737 = _loc4_.substr(_loc2_ + 1,_loc4_.length - (_loc2_ + 1));
            }
            _loc4_ = _loc4_.substr(0,_loc2_);
         }
         _loc2_ = _loc4_.search(":");
         _loc3_ = _loc4_.search("/");
         var _loc5_:Boolean = _loc2_ != -1;
         var _loc6_:Boolean = _loc3_ != -1;
         var _loc7_:Boolean = !_loc6_ || _loc2_ < _loc3_;
         if(_loc5_ && _loc7_)
         {
            this.var_3734 = _loc4_.substr(0,_loc2_);
            this.var_3734 = this.var_3734.toLowerCase();
            _loc4_ = _loc4_.substr(_loc2_ + 1);
            if(_loc4_.substr(0,2) != "//")
            {
               this.var_3738 = _loc4_;
               if((this.var_2779 = this.method_3336()) == false)
               {
                  this.name_3491();
               }
               return this.name_940();
            }
            this.var_3738 = "";
            _loc4_ = _loc4_.substr(2,_loc4_.length - 2);
         }
         else
         {
            this.var_3734 = "";
            this.var_3740 = true;
            this.var_3738 = "";
         }
         if(this.method_3323())
         {
            this.var_3735 = "";
            this.var_3741 = "";
            this.var_229 = _loc4_;
         }
         else
         {
            if(_loc4_.substr(0,2) == "//")
            {
               while(_loc4_.charAt(0) == "/")
               {
                  _loc4_ = _loc4_.substr(1,_loc4_.length - 1);
               }
            }
            _loc2_ = _loc4_.search("/");
            if(_loc2_ == -1)
            {
               this.var_3735 = _loc4_;
               this.var_229 = "";
            }
            else
            {
               this.var_3735 = _loc4_.substr(0,_loc2_);
               this.var_229 = _loc4_.substr(_loc2_,_loc4_.length - _loc2_);
            }
            _loc2_ = this.var_3735.search("@");
            if(_loc2_ != -1)
            {
               this.var_3736 = this.var_3735.substr(0,_loc2_);
               this.var_3735 = this.var_3735.substr(_loc2_ + 1);
               _loc2_ = this.var_3736.search(":");
               if(_loc2_ != -1)
               {
                  this.name_3068 = this.var_3736.substring(_loc2_ + 1,this.var_3736.length);
                  this.var_3736 = this.var_3736.substr(0,_loc2_);
               }
               else
               {
                  this.name_3068 = "";
               }
            }
            else
            {
               this.var_3736 = "";
               this.name_3068 = "";
            }
            _loc2_ = this.var_3735.search(":");
            if(_loc2_ != -1)
            {
               this.var_3741 = this.var_3735.substring(_loc2_ + 1,this.var_3735.length);
               this.var_3735 = this.var_3735.substr(0,_loc2_);
            }
            else
            {
               this.var_3741 = "";
            }
            this.var_3735 = this.var_3735.toLowerCase();
         }
         if((this.var_2779 = this.method_3336()) == false)
         {
            this.name_3491();
         }
         return this.name_940();
      }
      
      public function method_3322(param1:URI) : void
      {
         this.var_3734 = param1.var_3734;
         this.var_3735 = param1.var_3735;
         this.var_3736 = param1.var_3736;
         this.name_3068 = param1.name_3068;
         this.var_3741 = param1.var_3741;
         this.var_229 = param1.var_229;
         this.var_3737 = param1.var_3737;
         this.var_3742 = param1.var_3742;
         this.var_3738 = param1.var_3738;
         this.var_2779 = param1.var_2779;
         this.var_3740 = param1.var_3740;
      }
      
      protected function method_3341(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:RegExp = /[^a-z]/;
         param1 = param1.toLowerCase();
         _loc2_ = param1.search(_loc3_);
         if(_loc2_ == -1)
         {
            return true;
         }
         return false;
      }
      
      public function name_940() : Boolean
      {
         return this.var_2779;
      }
      
      public function method_3324() : Boolean
      {
         return !this.var_3740;
      }
      
      public function method_3323() : Boolean
      {
         return this.var_3740;
      }
      
      public function isDirectory() : Boolean
      {
         if(this.var_229.length == 0)
         {
            return false;
         }
         return this.var_229.charAt(this.path.length - 1) == "/";
      }
      
      public function method_3317() : Boolean
      {
         return this.method_3320;
      }
      
      public function get scheme() : String
      {
         return URI.method_3319(this.var_3734);
      }
      
      public function set scheme(param1:String) : void
      {
         var _loc2_:String = param1.toLowerCase();
         this.var_3734 = URI.method_3318(_loc2_,URI.const_2920);
      }
      
      public function get authority() : String
      {
         return URI.method_3319(this.var_3735);
      }
      
      public function set authority(param1:String) : void
      {
         param1 = param1.toLowerCase();
         this.var_3735 = URI.method_3318(param1,URI.const_2921);
         this.method_3320 = true;
      }
      
      public function get username() : String
      {
         return URI.method_3319(this.var_3736);
      }
      
      public function set username(param1:String) : void
      {
         this.var_3736 = URI.method_3318(param1,URI.const_2912);
         this.method_3320 = true;
      }
      
      public function get password() : String
      {
         return URI.method_3319(this.name_3068);
      }
      
      public function set password(param1:String) : void
      {
         this.name_3068 = URI.method_3318(param1,URI.const_2912);
         this.method_3320 = true;
      }
      
      public function get port() : String
      {
         return URI.method_3319(this.var_3741);
      }
      
      public function set port(param1:String) : void
      {
         this.var_3741 = URI.method_3333(param1);
         this.method_3320 = true;
      }
      
      public function get path() : String
      {
         return URI.method_3319(this.var_229);
      }
      
      public function set path(param1:String) : void
      {
         this.var_229 = URI.method_3318(param1,URI.const_2918);
         if(this.var_3734 == "unknown")
         {
            this.var_3734 = "";
         }
         this.method_3320 = true;
      }
      
      public function get query() : String
      {
         return URI.method_3319(this.var_3737);
      }
      
      public function set query(param1:String) : void
      {
         this.var_3737 = URI.method_3318(param1,URI.const_2909);
      }
      
      public function get queryRaw() : String
      {
         return this.var_3737;
      }
      
      public function set queryRaw(param1:String) : void
      {
         this.var_3737 = param1;
      }
      
      public function get fragment() : String
      {
         return URI.method_3319(this.var_3742);
      }
      
      public function set fragment(param1:String) : void
      {
         this.var_3742 = URI.method_3318(param1,const_2910);
      }
      
      public function get nonHierarchical() : String
      {
         return URI.method_3319(this.var_3738);
      }
      
      public function set nonHierarchical(param1:String) : void
      {
         this.var_3738 = URI.method_3318(param1,const_2914);
         this.method_3320 = false;
      }
      
      public function method_3334(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : void
      {
         this.scheme = param1;
         this.authority = param2;
         this.port = param3;
         this.path = param4;
         this.query = param5;
         this.fragment = param6;
         this.method_3320 = true;
      }
      
      public function method_3339(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return this.var_3734 == param1;
      }
      
      public function method_3351(param1:String) : String
      {
         var _loc2_:Object = null;
         var _loc3_:* = null;
         _loc2_ = this.method_3330();
         for(_loc3_ in _loc2_)
         {
            if(_loc3_ == param1)
            {
               return _loc2_[_loc3_];
            }
         }
         return new String("");
      }
      
      public function method_3347(param1:String, param2:String) : void
      {
         var _loc3_:Object = null;
         _loc3_ = this.method_3330();
         _loc3_[param1] = param2;
         this.method_3338(_loc3_);
      }
      
      public function method_3330() : Object
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Object = new Object();
         _loc1_ = this.var_3737;
         _loc3_ = _loc1_.split("&");
         for each(_loc2_ in _loc3_)
         {
            if(_loc2_.length != 0)
            {
               _loc4_ = _loc2_.split("=");
               if(_loc4_.length > 0)
               {
                  _loc5_ = String(_loc4_[0]);
                  if(_loc4_.length > 1)
                  {
                     _loc6_ = String(_loc4_[1]);
                  }
                  else
                  {
                     _loc6_ = "";
                  }
                  _loc5_ = method_3326(_loc5_);
                  _loc6_ = method_3326(_loc6_);
                  _loc7_[_loc5_] = _loc6_;
               }
            }
         }
         return _loc7_;
      }
      
      public function method_3338(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = "";
         for(_loc3_ in param1)
         {
            _loc4_ = String(param1[null]);
            if(_loc4_ == null)
            {
               _loc4_ = "";
            }
            _loc3_ = method_3328(_loc3_);
            _loc4_ = method_3328(_loc4_);
            _loc5_ = _loc3_;
            if(_loc4_.length > 0)
            {
               _loc5_ += "=";
               _loc5_ += _loc4_;
            }
            if(_loc6_.length != 0)
            {
               _loc6_ += "&";
            }
            _loc6_ += _loc5_;
         }
         this.var_3737 = _loc6_;
      }
      
      public function toString() : String
      {
         return "";
      }
      
      public function method_3352() : String
      {
         return this.method_3342(true);
      }
      
      protected function method_3342(param1:Boolean) : String
      {
         var _loc2_:String = "";
         var _loc3_:String = "";
         if(this.method_3317() == false)
         {
            _loc2_ += param1 ? this.scheme : this.var_3734;
            _loc2_ += ":";
            _loc2_ += param1 ? this.nonHierarchical : this.var_3738;
         }
         else
         {
            if(this.method_3323() == false)
            {
               if(this.var_3734.length != 0)
               {
                  _loc3_ = param1 ? this.scheme : this.var_3734;
                  _loc2_ += _loc3_ + ":";
               }
               if(this.var_3735.length != 0 || this.method_3339("file"))
               {
                  _loc2_ += "//";
                  if(this.var_3736.length != 0)
                  {
                     _loc3_ = param1 ? this.username : this.var_3736;
                     _loc2_ += _loc3_;
                     if(this.name_3068.length != 0)
                     {
                        _loc3_ = param1 ? this.password : this.name_3068;
                        _loc2_ += ":" + _loc3_;
                     }
                     _loc2_ += "@";
                  }
                  _loc3_ = param1 ? this.authority : this.var_3735;
                  _loc2_ += _loc3_;
                  if(this.port.length != 0)
                  {
                     _loc2_ += ":" + this.port;
                  }
               }
            }
            _loc3_ = param1 ? this.path : this.var_229;
            _loc2_ += _loc3_;
         }
         if(this.var_3737.length != 0)
         {
            _loc3_ = param1 ? this.query : this.var_3737;
            _loc2_ += "?" + _loc3_;
         }
         if(this.fragment.length != 0)
         {
            _loc3_ = param1 ? this.fragment : this.var_3742;
            _loc2_ += "#" + _loc3_;
         }
         return _loc2_;
      }
      
      public function method_3329() : void
      {
         this.scheme = this.scheme;
         this.method_3338(this.method_3330());
         this.fragment = this.fragment;
         if(this.method_3317())
         {
            this.authority = this.authority;
            this.path = this.path;
            this.port = this.port;
            this.username = this.username;
            this.password = this.password;
         }
         else
         {
            this.nonHierarchical = this.nonHierarchical;
         }
      }
      
      public function method_3346(param1:String) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         _loc3_ = param1.lastIndexOf(".");
         if(_loc3_ != -1)
         {
            param1 = param1.substr(_loc3_ + 1);
         }
         _loc2_ = this.method_3344(true);
         if(_loc2_ == "")
         {
            return false;
         }
         if(method_3321(_loc2_,param1,false) == 0)
         {
            return true;
         }
         return false;
      }
      
      public function method_3344(param1:Boolean = false) : String
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:String = this.method_3340();
         if(_loc4_ == "")
         {
            return String("");
         }
         _loc3_ = _loc4_.lastIndexOf(".");
         if(_loc3_ == -1 || _loc3_ == 0)
         {
            return String("");
         }
         _loc2_ = _loc4_.substr(_loc3_);
         if(param1 && _loc2_.charAt(0) == ".")
         {
            _loc2_ = _loc2_.substr(1);
         }
         return _loc2_;
      }
      
      public function method_3340(param1:Boolean = false) : String
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         if(this.isDirectory())
         {
            return String("");
         }
         var _loc4_:String = this.path;
         _loc3_ = _loc4_.lastIndexOf("/");
         if(_loc3_ != -1)
         {
            _loc2_ = _loc4_.substr(_loc3_ + 1);
         }
         else
         {
            _loc2_ = _loc4_;
         }
         if(param1)
         {
            _loc3_ = _loc2_.lastIndexOf(".");
            if(_loc3_ != -1)
            {
               _loc2_ = _loc2_.substr(0,_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function method_3332() : String
      {
         if(this.var_3734 == "http")
         {
            return String("80");
         }
         if(this.var_3734 == "ftp")
         {
            return String("21");
         }
         if(this.var_3734 == "file")
         {
            return String("");
         }
         if(this.var_3734 == "sftp")
         {
            return String("22");
         }
         return String("");
      }
      
      public function method_3331(param1:URI, param2:Boolean = true) : int
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:URI = URI.method_3327(this);
         var _loc9_:URI = URI.method_3327(param1);
         if(_loc8_.method_3323() || _loc9_.method_3323())
         {
            return URI.const_2907;
         }
         if(_loc8_.method_3317() == false || _loc9_.method_3317() == false)
         {
            if(_loc8_.method_3317() == false && _loc9_.method_3317() == true || _loc8_.method_3317() == true && _loc9_.method_3317() == false)
            {
               return URI.const_2907;
            }
            if(_loc8_.scheme != _loc9_.scheme)
            {
               return URI.const_2907;
            }
            if(_loc8_.nonHierarchical != _loc9_.nonHierarchical)
            {
               return URI.const_2907;
            }
            return URI.EQUAL;
         }
         if(_loc8_.scheme != _loc9_.scheme)
         {
            return URI.const_2907;
         }
         if(_loc8_.authority != _loc9_.authority)
         {
            return URI.const_2907;
         }
         var _loc10_:String = _loc8_.port;
         var _loc11_:String = _loc9_.port;
         if(_loc10_ == "")
         {
            _loc10_ = _loc8_.method_3332();
         }
         if(_loc11_ == "")
         {
            _loc11_ = _loc9_.method_3332();
         }
         if(_loc10_ != _loc11_)
         {
            return URI.const_2907;
         }
         if(method_3321(_loc8_.path,_loc9_.path,param2))
         {
            return URI.EQUAL;
         }
         var _loc12_:String = _loc8_.path;
         var _loc13_:String = _loc9_.path;
         if((_loc12_ == "/" || _loc13_ == "/") && (_loc12_ == "" || _loc13_ == ""))
         {
            return URI.EQUAL;
         }
         _loc3_ = _loc12_.split("/");
         _loc4_ = _loc13_.split("/");
         if(_loc3_.length > _loc4_.length)
         {
            _loc6_ = String(_loc4_[_loc4_.length - 1]);
            if(_loc6_.length > 0)
            {
               return URI.const_2907;
            }
            _loc4_.pop();
            _loc7_ = 0;
            while(_loc7_ < _loc4_.length)
            {
               _loc5_ = String(_loc3_[_loc7_]);
               _loc6_ = String(_loc4_[_loc7_]);
               if(method_3321(_loc5_,_loc6_,param2) == false)
               {
                  return URI.const_2907;
               }
               _loc7_++;
            }
            return URI.const_2924;
         }
         if(_loc3_.length < _loc4_.length)
         {
            _loc5_ = String(_loc3_[_loc3_.length - 1]);
            if(_loc5_.length > 0)
            {
               return URI.const_2907;
            }
            _loc3_.pop();
            _loc7_ = 0;
            while(_loc7_ < _loc3_.length)
            {
               _loc5_ = String(_loc3_[_loc7_]);
               _loc6_ = String(_loc4_[_loc7_]);
               if(method_3321(_loc5_,_loc6_,param2) == false)
               {
                  return URI.const_2907;
               }
               _loc7_++;
            }
            return URI.const_2922;
         }
         return URI.const_2907;
      }
      
      public function method_3349(param1:URI, param2:Boolean = true) : URI
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:URI = URI.method_3327(this);
         var _loc6_:URI = URI.method_3327(param1);
         if(!_loc5_.method_3324() || !_loc6_.method_3324() || _loc5_.method_3317() == false || _loc6_.method_3317() == false)
         {
            return null;
         }
         var _loc7_:int = _loc5_.method_3331(_loc6_);
         if(_loc7_ == URI.const_2907)
         {
            return null;
         }
         _loc5_.method_3325(".");
         _loc6_.method_3325(".");
         do
         {
            _loc7_ = _loc5_.method_3331(_loc6_,param2);
            if(_loc7_ == URI.EQUAL || _loc7_ == URI.const_2922)
            {
               break;
            }
            _loc3_ = _loc5_.toString();
            _loc5_.method_3325("..");
            _loc4_ = _loc5_.toString();
         }
         while(_loc3_ != _loc4_);
         
         return _loc5_;
      }
      
      public function method_3325(param1:String, param2:Boolean = false) : Boolean
      {
         var _loc3_:URI = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:String = param1;
         if(param2)
         {
            _loc11_ = URI.method_3333(param1);
         }
         if(_loc11_ == "")
         {
            return true;
         }
         if(_loc11_.substr(0,2) == "//")
         {
            _loc10_ = this.scheme + ":" + _loc11_;
            return this.method_3335(_loc10_);
         }
         if(_loc11_.charAt(0) == "?")
         {
            _loc11_ = "./" + _loc11_;
         }
         _loc3_ = new URI(_loc11_);
         if(_loc3_.method_3324() || _loc3_.method_3317() == false)
         {
            this.method_3322(_loc3_);
            return true;
         }
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = false;
         _loc4_ = this.path;
         _loc5_ = _loc3_.path;
         if(_loc4_.length > 0)
         {
            _loc6_ = _loc4_.split("/");
         }
         else
         {
            _loc6_ = new Array();
         }
         if(_loc5_.length > 0)
         {
            _loc7_ = _loc5_.split("/");
         }
         else
         {
            _loc7_ = new Array();
         }
         if(_loc6_.length > 0 && _loc6_[0] == "")
         {
            _loc14_ = true;
            _loc6_.shift();
         }
         if(_loc6_.length > 0 && _loc6_[_loc6_.length - 1] == "")
         {
            _loc12_ = true;
            _loc6_.pop();
         }
         if(_loc7_.length > 0 && _loc7_[0] == "")
         {
            _loc15_ = true;
            _loc7_.shift();
         }
         if(_loc7_.length > 0 && _loc7_[_loc7_.length - 1] == "")
         {
            _loc13_ = true;
            _loc7_.pop();
         }
         if(_loc15_)
         {
            this.path = _loc3_.path;
            this.queryRaw = _loc3_.queryRaw;
            this.fragment = _loc3_.fragment;
            return true;
         }
         if(_loc7_.length == 0 && _loc3_.query == "")
         {
            this.fragment = _loc3_.fragment;
            return true;
         }
         if(_loc12_ == false && _loc6_.length > 0)
         {
            _loc6_.pop();
         }
         this.queryRaw = _loc3_.queryRaw;
         this.fragment = _loc3_.fragment;
         _loc6_ = _loc6_.concat(_loc7_);
         _loc9_ = 0;
         while(_loc9_ < _loc6_.length)
         {
            _loc8_ = String(_loc6_[_loc9_]);
            _loc16_ = false;
            if(_loc8_ == ".")
            {
               _loc6_.splice(_loc9_,1);
               _loc9_ -= 1;
               _loc16_ = true;
            }
            else if(_loc8_ == "..")
            {
               if(_loc9_ >= 1)
               {
                  if(_loc6_[_loc9_ - 1] != "..")
                  {
                     _loc6_.splice(_loc9_ - 1,2);
                     _loc9_ -= 2;
                  }
               }
               else if(!this.method_3323())
               {
                  _loc6_.splice(_loc9_,1);
                  _loc9_ -= 1;
               }
               _loc16_ = true;
            }
            _loc9_++;
         }
         var _loc17_:String = "";
         _loc13_ ||= _loc16_;
         _loc17_ = this.method_3337(_loc6_,_loc14_,_loc13_);
         this.path = _loc17_;
         return true;
      }
      
      protected function method_3337(param1:Array, param2:Boolean, param3:Boolean) : String
      {
         var _loc4_:int = 0;
         var _loc5_:String = "";
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            if(_loc5_.length > 0)
            {
               _loc5_ += "/";
            }
            _loc5_ += param1[_loc4_];
            _loc4_++;
         }
         if(param3 && _loc5_.length > 0)
         {
            _loc5_ += "/";
         }
         if(param2)
         {
            _loc5_ = "/" + _loc5_;
         }
         return _loc5_;
      }
      
      public function method_3350(param1:URI) : Boolean
      {
         if(this.method_3324() || param1.method_3323())
         {
            return false;
         }
         var _loc2_:URI = new URI();
         _loc2_.method_3322(param1);
         if(_loc2_.method_3325(this.toString()) == false)
         {
            return false;
         }
         this.method_3322(_loc2_);
         return true;
      }
      
      public function method_3345(param1:URI, param2:Boolean = true) : Boolean
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:URI = new URI();
         _loc9_.method_3322(param1);
         var _loc10_:Array = new Array();
         var _loc11_:String = this.path;
         var _loc12_:String = this.queryRaw;
         var _loc13_:String = this.fragment;
         var _loc14_:Boolean = false;
         if(this.method_3323())
         {
            return true;
         }
         if(_loc9_.method_3323())
         {
            return false;
         }
         if(this.method_3339(param1.scheme) == false || this.authority != param1.authority)
         {
            return false;
         }
         _loc14_ = this.isDirectory();
         _loc9_.method_3325(".");
         _loc3_ = _loc11_.split("/");
         _loc4_ = _loc9_.path.split("/");
         if(_loc3_.length > 0 && _loc3_[0] == "")
         {
            _loc3_.shift();
         }
         if(_loc3_.length > 0 && _loc3_[_loc3_.length - 1] == "")
         {
            _loc14_ = true;
            _loc3_.pop();
         }
         if(_loc4_.length > 0 && _loc4_[0] == "")
         {
            _loc4_.shift();
         }
         if(_loc4_.length > 0 && _loc4_[_loc4_.length - 1] == "")
         {
            _loc4_.pop();
         }
         while(_loc4_.length > 0)
         {
            if(_loc3_.length == 0)
            {
               break;
            }
            _loc5_ = String(_loc3_[0]);
            _loc6_ = String(_loc4_[0]);
            if(!method_3321(_loc5_,_loc6_,param2))
            {
               break;
            }
            _loc3_.shift();
            _loc4_.shift();
         }
         _loc8_ = 0;
         while(_loc8_ < _loc4_.length)
         {
            _loc10_.push("..");
            _loc8_++;
         }
         _loc10_ = _loc10_.concat(_loc3_);
         _loc7_ = this.method_3337(_loc10_,false,_loc14_);
         if(_loc7_.length == 0)
         {
            _loc7_ = "./";
         }
         this.method_3334("","","",_loc7_,_loc12_,_loc13_);
         return true;
      }
      
      public function method_3348(param1:String, param2:String = "http") : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(param1.length == 0)
         {
            this.name_3491();
            return false;
         }
         param1 = param1.replace(/\\/g,"/");
         if(param1.length >= 2)
         {
            _loc3_ = param1.substr(0,2);
            if(_loc3_ == "//")
            {
               param1 = param2 + ":" + param1;
            }
         }
         if(param1.length >= 3)
         {
            _loc3_ = param1.substr(0,3);
            if(_loc3_ == "://")
            {
               param1 = param2 + param1;
            }
         }
         var _loc5_:URI = new URI(param1);
         if(_loc5_.method_3317() == false)
         {
            if(_loc5_.scheme == "unknown")
            {
               this.name_3491();
               return false;
            }
            this.method_3322(_loc5_);
            this.method_3329();
            return true;
         }
         if(_loc5_.scheme != "unknown" && _loc5_.scheme.length > 0)
         {
            if(_loc5_.authority.length > 0 || _loc5_.scheme == "file")
            {
               this.method_3322(_loc5_);
               this.method_3329();
               return true;
            }
            if(_loc5_.authority.length == 0 && _loc5_.path.length == 0)
            {
               this.method_3334(_loc5_.scheme,"","","","","");
               return false;
            }
         }
         else
         {
            _loc4_ = _loc5_.path;
            if(_loc4_ == ".." || _loc4_ == "." || _loc4_.length >= 3 && _loc4_.substr(0,3) == "../" || _loc4_.length >= 2 && _loc4_.substr(0,2) == "./")
            {
               this.method_3322(_loc5_);
               this.method_3329();
               return true;
            }
         }
         _loc5_ = new URI(param2 + "://" + param1);
         if(_loc5_.scheme.length > 0 && _loc5_.authority.length > 0)
         {
            this.method_3322(_loc5_);
            this.method_3329();
            return true;
         }
         this.name_3491();
         return false;
      }
   }
}
