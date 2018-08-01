.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	bitcore-wallet-client-alarmx.min.js

clean:
	rm bitcore-wallet-client-alarmx.js
	rm bitcore-wallet-client-alarmx.min.js

bitcore-wallet-client-alarmx.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

bitcore-wallet-client-alarmx.min.js: bitcore-wallet-client-alarmx.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
