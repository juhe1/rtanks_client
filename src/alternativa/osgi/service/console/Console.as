package alternativa.osgi.service.console
{
   import alternativa.osgi.service.command.class_16;
   import alternativa.osgi.service.command.name_43;
   import alternativa.utils.CircularStringBuffer;
   import alternativa.utils.name_824;
   import alternativa.utils.name_827;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.setTimeout;
   import package_242.name_821;
   import alternativa.osgi.OSGi;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class Console implements name_27
   {
      
      private static const const_46:uint = 16777215;
      
      private static const const_45:uint = 0;
      
      private static const const_42:TextFormat = new TextFormat("Courier New",12,0);
      
      private static const const_47:int = 20;
      
      private static const const_43:RegExp = /\n|\r|\n\r/;
      
      private static const const_44:RegExp = /(?:[^"\s]+)|(?:"[^"]*")/g;
       
      
      private var stage:Stage;
      
      private var var_170:Sprite;
      
      private var var_179:Sprite;
      
      private var input:TextField;
      
      private var var_174:Vector.<TextField>;
      
      private var var_184:int;
      
      private var var_181:int;
      
      private var var_185:int = 0;
      
      private var var_183:Boolean;
      
      private var visible:Boolean;
      
      private var var_176:Array;
      
      private var var_173:int = 0;
      
      private var var_175:Object;
      
      private var var_171:int;
      
      private var var_180:int;
      
      private var var_172:int;
      
      private var buffer:name_827;
      
      private var var_177:int;
      
      private var var_178:int;
      
      private var align:int;
      
      private var var_186:uint = 16777215;
      
      private var var_187:uint = 0;
      
      private var _alpha:Number = 1;
      
      private var filter:String;
      
      private var commandService:name_43;
      
      private var var_182:Error;
      
      public function Console(param1:name_43, param2:Stage, param3:int, param4:int, param5:int, param6:int)
      {
         this.var_170 = new Sprite();
         this.var_174 = new Vector.<TextField>();
         this.var_176 = [];
         this.var_175 = {};
         super();
         this.commandService = param1;
         this.stage = param2;
         this.buffer = new CircularStringBuffer(1000);
         this.method_234(param2);
         this.method_251();
         this.method_239();
         this.setSize(param3,param4);
         this.horizontalAlignment = param5;
         this.vericalAlignment = param6;
         param2.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         param2.addEventListener(Event.RESIZE,this.onResize);
         param1.name_822("console","hide","Спрятать консоль",[],this.method_240);
         param1.name_822("console","copy","Скопировать содержимое консоли в буфер обмена",[],this.method_248);
         param1.name_822("cmd","clear","Очистить консоль",[],this.method_249);
         param1.name_822("cmd","e","Показать последний exception",[],this.method_243);
         param1.name_822("console","height","Установить высоту консоли",[int],this.method_235);
         param1.name_822("console","width","Установить ширину консоли",[int],this.method_252);
         param1.name_822("console","halign","Выравнивание по горизонтали",[int],this.method_231);
         param1.name_822("console","valign","Выравнивание по вертикали",[int],this.method_250);
         param1.name_822("console","alpha","Установить прозрачность консоли",[Number],this.method_238);
         param1.name_822("console","bg","Установить цвет фона",[uint],this.method_229);
         param1.name_822("console","fg","Установить цвет шрифта",[uint],this.method_233);
         param1.name_822("vars","list","Посмотреть список переменных",[],this.method_241);
         param1.name_822("vars","show","Посмотреть переменную",[String],this.method_227);
         param1.name_822("vars", "set", "Установить значение переменной", [String, String], this.method_225);
         param1.name_822("hacks","send_command","Send command to server",[String],this.sendCommandToServer);
      }
      
      private function sendCommandToServer(param1:class_16, command:String) : void {
         Network(OSGi.getInstance().getService(INetworker)).send(command);
      }
      
      private function method_225(param1:class_16, param2:String, param3:String) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:name_821 = this.var_175[param2];
         if(_loc6_ != null)
         {
            _loc4_ = _loc6_.toString();
            _loc5_ = _loc6_.name_828(param3);
            if(_loc5_ == null)
            {
               param1.method_209("New value " + _loc6_.toString() + ", old value=" + _loc4_);
               return;
            }
            throw new name_826(param2,param3,_loc5_);
         }
         throw new name_823(param2);
      }
      
      private function method_227(param1:class_16, param2:String) : void
      {
         var _loc3_:name_821 = this.var_175[param2];
         if(_loc3_ != null)
         {
            param1.method_209(_loc3_.toString());
            return;
         }
         throw new name_823(param2);
      }
      
      private function method_241(param1:class_16) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in this.var_175)
         {
            param1.method_209(_loc2_);
         }
      }
      
      private function method_243(param1:class_16) : void
      {
         if(Boolean(this.var_182))
         {
            param1.method_209(this.var_182.getStackTrace());
         }
      }
      
      public function method_212(param1:name_821) : void
      {
         this.var_175[param1.name_829()] = param1;
      }
      
      public function method_215(param1:String) : void
      {
         delete this.var_175[param1];
      }
      
      public function set horizontalAlignment(param1:int) : void
      {
         param1 = this.method_218(param1,1,3);
         this.align = this.align & ~3 | param1;
         this.method_217();
      }
      
      public function get horizontalAlignment() : int
      {
         return this.align & 3;
      }
      
      public function set vericalAlignment(param1:int) : void
      {
         param1 = this.method_218(param1,1,3);
         this.align = this.align & ~12 | param1 << 2;
         this.method_217();
      }
      
      public function get vericalAlignment() : int
      {
         return this.align >> 2 & 3;
      }
      
      public function method_209(param1:String) : void
      {
         var _loc2_:Boolean = this.buffer.size - this.var_172 <= this.var_171;
         var _loc3_:int = this.method_223(param1);
         if(_loc2_)
         {
            this.method_216(_loc3_);
         }
      }
      
      public function method_207(param1:String, param2:String) : void
      {
         var _loc3_:Boolean = this.buffer.size - this.var_172 <= this.var_171;
         var _loc4_:int = this.method_222(param1,param2);
         if(_loc3_)
         {
            this.method_216(_loc4_);
         }
      }
      
      public function method_208(param1:Vector.<String>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:Boolean = this.buffer.size - this.var_172 <= this.var_171;
         for each(_loc3_ in param1)
         {
            _loc2_ += this.method_223(_loc3_);
         }
         if(_loc4_)
         {
            this.method_216(_loc2_);
         }
      }
      
      public function method_210(param1:String, param2:Vector.<String>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Boolean = this.buffer.size - this.var_172 <= this.var_171;
         for each(_loc4_ in param2)
         {
            _loc3_ += this.method_222(param1,_loc4_);
         }
         if(_loc5_)
         {
            this.method_216(_loc3_);
         }
      }
      
      public function show() : void
      {
         if(this.visible)
         {
            return;
         }
         this.stage.addChild(this.var_170);
         this.stage.focus = this.input;
         this.visible = true;
         this.onResize(null);
         this.method_216(0);
      }
      
      public function hide() : void
      {
         if(this.stage == null)
         {
            return;
         }
         if(this.visible)
         {
            this.stage.removeChild(this.var_170);
            this.stage.focus = this.stage;
            this.visible = false;
         }
      }
      
      public function method_213() : Boolean
      {
         return this.visible;
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         param1 = this.method_218(param1,1,100);
         param2 = this.method_218(param2,1,100);
         if(param1 == this.var_177 && param2 == this.var_178)
         {
            return;
         }
         this.var_177 = param1;
         this.var_178 = param2;
         this.method_219();
         this.method_217();
      }
      
      public function set width(param1:int) : void
      {
         this.setSize(param1,this.var_178);
      }
      
      public function get width() : int
      {
         return this.var_177;
      }
      
      public function set height(param1:int) : void
      {
         this.setSize(this.var_177,param1);
      }
      
      public function get height() : int
      {
         return this.var_178;
      }
      
      public function method_224(param1:uint) : void
      {
         setTimeout(this.hide,param1);
      }
      
      public function name_51(param1:String) : void
      {
         var len:int;
         var text:String = param1;
         if(Boolean(text.match(/^\s*$/)))
         {
            return;
         }
         len = int(this.var_176.length);
         if(len == 0 || this.var_176[len - 1] != text)
         {
            this.var_176.push(text);
         }
         this.var_173 = len + 1;
         try
         {
            this.commandService.execute(text,this);
            return;
         }
         catch(e:Error)
         {
            method_209(e.message);
            var_182 = e;
            return;
         }
      }
      
      public function set alpha(param1:Number) : void
      {
         this._alpha = param1;
         this.method_219();
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      private function method_234(param1:Stage) : void
      {
         var _loc2_:TextField = new TextField();
         _loc2_.defaultTextFormat = const_42;
         _loc2_.text = "j";
         param1.addChild(_loc2_);
         this.var_184 = _loc2_.textWidth;
         this.var_181 = _loc2_.textHeight + 4;
         param1.removeChild(_loc2_);
      }
      
      private function method_251() : void
      {
         this.input = new TextField();
         this.input.defaultTextFormat = const_42;
         this.input.height = 20;
         this.input.type = TextFieldType.INPUT;
         this.input.background = true;
         this.input.backgroundColor = 16777215;
         this.input.border = true;
         this.input.borderColor = 0;
         this.input.addEventListener(KeyboardEvent.KEY_DOWN,this.method_237);
         this.input.addEventListener(KeyboardEvent.KEY_UP,this.method_236);
         this.input.addEventListener(TextEvent.TEXT_INPUT,this.method_244);
         this.var_170.addChild(this.input);
      }
      
      private function method_239() : void
      {
         this.var_179 = new Sprite();
         this.var_179.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
         this.var_170.addChild(this.var_179);
      }
      
      private function method_246(param1:int, param2:int) : void
      {
         this.var_171 = param2 / (this.var_181 + this.var_185);
         this.var_180 = param1 / this.var_184 - 1;
         this.method_247(param1);
         this.method_216(0);
         var _loc3_:Graphics = this.var_179.graphics;
         _loc3_.clear();
         _loc3_.beginFill(this.var_186,this._alpha);
         _loc3_.drawRect(0,0,param1,param2);
         _loc3_.endFill();
      }
      
      private function method_247(param1:int) : void
      {
         var _loc2_:TextField = null;
         while(this.var_174.length > this.var_171)
         {
            this.var_179.removeChild(this.var_174.pop());
         }
         while(this.var_174.length < this.var_171)
         {
            this.method_242();
         }
         var _loc3_:int = this.var_181 + this.var_185;
         var _loc4_:int = 0;
         while(_loc4_ < this.var_174.length)
         {
            _loc2_ = this.var_174[_loc4_];
            _loc2_.y = _loc4_ * _loc3_;
            _loc2_.width = param1;
            _loc4_++;
         }
      }
      
      private function method_242() : void
      {
         var _loc1_:TextField = new TextField();
         _loc1_.height = this.var_181;
         _loc1_.defaultTextFormat = const_42;
         _loc1_.tabEnabled = false;
         _loc1_.selectable = true;
         this.var_179.addChild(_loc1_);
         this.var_174.push(_loc1_);
      }
      
      private function method_216(param1:int) : void
      {
         this.var_172 += param1;
         if(this.var_172 + this.var_171 > this.buffer.size)
         {
            this.var_172 = this.buffer.size - this.var_171;
         }
         if(this.var_172 < 0)
         {
            this.var_172 = 0;
         }
         this.method_232();
      }
      
      private function method_232() : void
      {
         if(this.var_170.parent != null)
         {
            this.method_228();
         }
      }
      
      private function method_228() : void
      {
         var _loc1_:int = 0;
         var _loc2_:name_824 = this.buffer.name_825(this.var_172);
         while(_loc1_ < this.var_171 && Boolean(_loc2_.hasNext()))
         {
            TextField(this.var_174[_loc1_++]).text = _loc2_.getNext();
         }
         while(_loc1_ < this.var_171)
         {
            TextField(this.var_174[_loc1_++]).text = "";
         }
      }
      
      private function method_237(param1:KeyboardEvent) : void
      {
         if(this.method_220(param1))
         {
            this.var_183 = true;
         }
         switch(param1.keyCode)
         {
            case Keyboard.ENTER:
               this.method_230();
               break;
            case Keyboard.ESCAPE:
               if(this.input.text != "")
               {
                  this.input.text = "";
                  break;
               }
               this.method_224(50);
               break;
            case Keyboard.UP:
               this.method_226();
               break;
            case Keyboard.DOWN:
               this.method_245();
               break;
            case Keyboard.PAGE_UP:
               this.method_216(-this.var_171);
               break;
            case Keyboard.PAGE_DOWN:
               this.method_216(this.var_171);
         }
         param1.stopPropagation();
      }
      
      private function method_236(param1:KeyboardEvent) : void
      {
         if(!this.method_220(param1))
         {
            param1.stopPropagation();
         }
      }
      
      private function method_244(param1:TextEvent) : void
      {
         if(this.var_183)
         {
            param1.preventDefault();
            this.var_183 = false;
         }
      }
      
      private function method_220(param1:KeyboardEvent) : Boolean
      {
         return param1.keyCode == 75 && param1.ctrlKey && param1.shiftKey;
      }
      
      private function method_230() : void
      {
         this.method_216(this.buffer.size);
         var _loc1_:String = this.input.text;
         this.input.text = "";
         this.method_209("> " + _loc1_);
         this.name_51(_loc1_);
      }
      
      private function method_226() : void
      {
         if(this.var_173 == 0)
         {
            return;
         }
         --this.var_173;
         var _loc1_:String = String(this.var_176[this.var_173]);
         this.input.text = _loc1_ == null ? "" : _loc1_;
      }
      
      private function method_245() : void
      {
         ++this.var_173;
         if(this.var_173 >= this.var_176.length)
         {
            this.var_173 = this.var_176.length;
            this.input.text = "";
         }
         else
         {
            this.input.text = this.var_176[this.var_173];
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(this.method_220(param1))
         {
            if(this.visible)
            {
               this.hide();
            }
            else
            {
               this.show();
            }
         }
      }
      
      private function onResize(param1:Event) : void
      {
         this.method_219();
         this.method_217();
      }
      
      private function method_223(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:Array = param1.split(const_43);
         for each(_loc3_ in _loc5_)
         {
            if(!(this.filter && _loc3_.indexOf(this.filter) < 0))
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  this.buffer.add(_loc3_.substr(_loc4_,this.var_180));
                  _loc2_++;
                  _loc4_ += this.var_180;
               }
            }
         }
         return _loc2_;
      }
      
      private function method_222(param1:String, param2:String) : int
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:Array = param2.split(const_43);
         var _loc7_:int = this.var_180 - param1.length;
         for each(_loc4_ in _loc6_)
         {
            if(!(this.filter && _loc4_.indexOf(this.filter) < 0))
            {
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  this.buffer.add(param1 + _loc4_.substr(_loc5_,_loc7_));
                  _loc3_++;
                  _loc5_ += _loc7_;
               }
            }
         }
         return _loc3_;
      }
      
      private function onMouseWheel(param1:MouseEvent) : void
      {
         this.method_216(-param1.delta);
      }
      
      private function method_218(param1:int, param2:int, param3:int) : int
      {
         if(param1 < param2)
         {
            return param2;
         }
         if(param1 > param3)
         {
            return param3;
         }
         return param1;
      }
      
      private function method_219() : void
      {
         var _loc1_:int = 0.01 * this.var_178 * this.stage.stageHeight;
         var _loc2_:int = 0.01 * this.var_177 * this.stage.stageWidth;
         var _loc3_:int = _loc1_ - 20;
         this.method_246(_loc2_,_loc3_);
         this.input.y = _loc3_;
         this.input.width = _loc2_;
      }
      
      private function method_217() : void
      {
         var _loc1_:int = this.align & 3;
         switch(_loc1_)
         {
            case 1:
               this.var_170.x = 0;
               break;
            case 2:
               this.var_170.x = this.stage.stageWidth - this.var_170.width;
               break;
            case 3:
               this.var_170.x = this.stage.stageWidth - this.var_170.width >> 1;
         }
         var _loc2_:int = this.align >> 2 & 3;
         switch(_loc2_)
         {
            case 1:
               this.var_170.y = 0;
               break;
            case 2:
               this.var_170.y = this.stage.stageHeight - this.var_170.height;
               break;
            case 3:
               this.var_170.y = this.stage.stageHeight - this.var_170.height >> 1;
         }
      }
      
      private function method_240(param1:class_16) : void
      {
         this.method_224(100);
      }
      
      private function method_248(param1:class_16) : void
      {
         var _loc2_:name_824 = this.buffer.name_825(0);
         var _loc3_:String = "Console content:\r\n";
         while(_loc2_.hasNext())
         {
            _loc3_ += _loc2_.getNext() + "\r\n";
         }
         System.setClipboard(_loc3_);
         this.method_209("Content has been copied to clipboard");
      }
      
      private function method_249(param1:class_16) : void
      {
         this.buffer.clear();
         this.method_216(0);
      }
      
      private function method_231(param1:class_16, param2:int) : void
      {
         this.horizontalAlignment = param2;
      }
      
      private function method_250(param1:class_16, param2:int) : void
      {
         this.vericalAlignment = param2;
      }
      
      private function method_252(param1:class_16, param2:int) : void
      {
         this.setSize(param2,this.var_178);
      }
      
      private function method_235(param1:class_16, param2:int) : void
      {
         this.setSize(this.var_177,param2);
      }
      
      private function method_238(param1:class_16, param2:Number) : void
      {
         this.alpha = param2;
      }
      
      private function method_229(param1:class_16, param2:uint) : void
      {
         this.method_219();
         this.input.backgroundColor = param2;
         param1.method_209("Background color set to " + param2);
      }
      
      private function method_233(param1:class_16, param2:uint) : void
      {
         var _loc3_:TextField = null;
         const_42.color = param2;
         this.input.textColor = param2;
         this.input.defaultTextFormat = const_42;
         for each(_loc3_ in this.var_174)
         {
            _loc3_.textColor = param2;
            _loc3_.defaultTextFormat = const_42;
         }
         param1.method_209("Foreground color set to " + param2);
      }
      
      private function method_253(param1:name_27, param2:Array) : void
      {
         this.method_221(param2[0],false);
      }
      
      private function method_254(param1:name_27, param2:Array) : void
      {
         this.method_221(param2[0],true);
      }
      
      private function method_221(param1:String, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:name_821 = null;
         var _loc5_:String = null;
         var _loc6_:Array = [];
         for(_loc3_ in this.var_175)
         {
            if(param1 == null || param1 == "" || _loc3_.indexOf(param1) == 0)
            {
               _loc4_ = this.var_175[_loc3_];
               _loc6_.push(param2 ? _loc3_ + " = " + _loc4_.toString() : _loc3_);
            }
         }
         if(_loc6_.length > 0)
         {
            _loc6_.sort();
            for each(_loc5_ in _loc6_)
            {
               this.method_209(_loc5_);
            }
         }
      }
      
      public function method_211(param1:String, param2:Function) : void
      {
      }
      
      public function method_214(param1:String) : void
      {
      }
   }
}
