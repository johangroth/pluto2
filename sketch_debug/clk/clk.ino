
#define SINGLE_STEP 0
#define CONTINUES 1

const unsigned int UP = 5;
const unsigned int DOWN = 4;
const unsigned int STEP = 3;
const unsigned int SWITCH = 2;
unsigned int state = SINGLE_STEP;
unsigned int clk = HIGH;

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(UP, INPUT_PULLUP);
  pinMode(DOWN, INPUT_PULLUP);
  pinMode(STEP, INPUT_PULLUP);
  pinMode(SWITCH, INPUT_PULLUP);
  Serial.begin(115200);
}

void loop() {
  unsigned long lastDebounceTime = 0;
  unsigned long lastSwitchDebounceTime = 0;
  unsigned long debounceDelay = 200;
  char str[255];
  unsigned int delayTime = 500;
  unsigned int state = CONTINUES;
  while (true) {
    boolean up_btn = !digitalRead(UP) ? true : false;
    boolean down_btn = !digitalRead(DOWN) ? true : false;
    boolean step_btn = !digitalRead(STEP) ? true : false;
    boolean switch_btn = !digitalRead(SWITCH) ? true : false;

    if ((millis() - lastSwitchDebounceTime) > debounceDelay) {
      if (switch_btn == true) {
        if (state == CONTINUES ) {
          state = SINGLE_STEP;
          digitalWrite(LED_BUILTIN, LOW);
          Serial.println("Single step");
        } else if (state == SINGLE_STEP) {
          state = CONTINUES;
          Serial.println("Continues");
        } else { // Unknown state
          sprintf(str, "Unknown state %d. Setting state single step", state);
          Serial.println(str);
          state = SINGLE_STEP;
        }
      }
      lastSwitchDebounceTime = millis();
    }
    if((millis() - lastDebounceTime) > debounceDelay) {
      if (state == SINGLE_STEP && step_btn) {
        sendOneClockPulse(delayTime);
        Serial.println("Sent clock pulse");
      } else if (state == CONTINUES) {
        if (up_btn) {
          delayTime -= 10;
        } else if (down_btn) {
          delayTime += 10;
        }
        delayTime = (delayTime <= 10) ? 10 : delayTime;
        sprintf(str, "UP %s, DOWN %s, DELAY %d", bool_fmt(up_btn), bool_fmt(down_btn), delayTime);
        Serial.println(str);
      }
      lastDebounceTime = millis();
    }
    if (state == CONTINUES) {
      clk = !clk;
      digitalWrite(LED_BUILTIN, clk);
      delay(delayTime);
    }
  }
}

const char* bool_fmt(boolean bool_expr) {
  return bool_expr ? "true" : "false";
}

void sendOneClockPulse(unsigned int delayTime) {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(delayTime);
  digitalWrite(LED_BUILTIN, LOW);
}
  
