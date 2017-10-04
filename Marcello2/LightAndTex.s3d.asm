0:	PUSHN	1		
1:	CALLX	16 :CVMMOUSE		0
2:	POP  			G0:MOUSE
3:	CALLX	10 :CVMJOYSTICK		0
4:	POP  			G1:JOYSTICK
5:	CALLX	13 :CVMMMAVI		0
6:	POP  			G2:MMAVI
7:	CALLX	15 :CVMMMMP3		0
8:	POP  			G3:MMMP3
9:	CALLX	14 :CVMMMMIDI		0
10:	POP  			G4:MMMIDI
11:	ANEW 	0		G5:IMPULSEDATA
12:	MOV  	<cVct0 [ 0 , 5 , 30 ]>		G6:CAMPOS
13:	MOV  	10		G8:RADIUS
14:	VNEW 	3		BP(1)
15:	SET  	G8:RADIUS	2	BP(1)
16:	MOV  	BP(1)		G9:POSL
17:	MOV  	0		G10:ANG_VERT
18:	MOV  	0		G11:ANG_ORIZ
19:	MOV  	<cVct1 [ 0.5 , 0.5 , 0.5 , 1 ]>		G16:AMBIENT_COLOR
20:	MOV  	<cVct1 [ 0.5 , 0.5 , 0.5 , 1 ]>		G17:DIFFUSE_COLOR
21:	MOV  	<cVct1 [ 0.5 , 0.5 , 0.5 , 1 ]>		G18:SPECULAR_COLOR
22:	MOV  	64		G19:SHININESS
23:	MOV  	<cVct2 [ 0.5 , 0.5 , 0.5 ]>		G20:AMBIENT_LIGHT
24:	MOV  	<cVct2 [ 0.5 , 0.5 , 0.5 ]>		G21:DIFFUSE_LIGHT
25:	MOV  	<cVct2 [ 0.5 , 0.5 , 0.5 ]>		G22:SPECULAR_LIGHT
26:	MOV  	1		G26:SEGS
27:	MOV  	0		G27:ACTIVE_COMPONENT
28:	MOV  	0		G28:ACTIVE_OBJECT
29:	RET  			
30:	PUSHN	5		
31:	LEN  	G5:IMPULSEDATA		BP(1)
32:	JGEQ 	BP(1)	P1:IMPNO	Quad:34
33:	ASIZE	P1:IMPNO	G5:IMPULSEDATA	
34:	SUB  	P3:END	P2:START	BP(1)
35:	SUB  	P1:IMPNO	1	BP(2)
36:	ANEW 	4		BP(3)
37:	SET  	0	0	BP(3)
38:	SET  	P2:START	1	BP(3)
39:	SET  	BP(1)	2	BP(3)
40:	DIV  	1	P4:TIME	BP(4)
41:	SET  	BP(4)	3	BP(3)
42:	SET  	BP(3)	BP(2)	G5:IMPULSEDATA
43:	RET  	Void		
44:	PUSHN	12		
45:	SUB  	P1:IMPNO	1	BP(1)
46:	GET  	G5:IMPULSEDATA	BP(1)	BP(1)
47:	CALLX	21 :GETTIME		0
48:	POP  			BP(2)
49:	GET  	BP(1)	1	BP(3)
50:	GET  	BP(1)	2	BP(4)
51:	GET  	BP(1)	0	BP(5)
52:	JNEQ 	BP(5)	0	Quad:54
53:	SET  	BP(2)	0	BP(1)
54:	GET  	BP(1)	0	BP(6)
55:	SUB  	BP(2)	BP(6)	BP(6)
56:	GET  	BP(1)	3	BP(7)
57:	MUL  	BP(6)	BP(7)	BP(5)
58:	JLEQ 	BP(5)	1	Quad:60
59:	MOV  	1		BP(5)
60:	MUL  	BP(4)	BP(5)	BP(6)
61:	ADD  	BP(3)	BP(6)	BP(6)
62:	RET  	BP(6)		
63:	PUSHN	4		
64:	SUB  	P1:IMPNO	1	BP(1)
65:	GET  	G5:IMPULSEDATA	BP(1)	BP(1)
66:	CALLX	21 :GETTIME		0
67:	POP  			BP(2)
68:	GET  	BP(1)	0	BP(3)
69:	SUB  	BP(3)		BP(2)
70:	GET  	BP(1)	3	BP(3)
71:	MUL  	BP(3)		BP(2)
72:	JGR  	BP(2)	1	Quad:74
73:	RET  	True		
74:	RET  	False		
75:	PUSHN	0		
76:	PUSH 	<cStr3 "Data.zip">		
77:	CALLX	20 :FILEDOWNLOAD		1
78:	POPN 	2		
79:	RET  	Void		
80:	PUSHN	3		
81:	PUSH 	11		
82:	PUSH 	<cStr4 "Lucida console">		
83:	CALLX	8 :CONSOLEFONT		2
84:	POPN 	3		
85:	PUSH 	G6:CAMPOS		
86:	CALLX	7 :CAMERASETPOSITION		1
87:	POPN 	2		
88:	PUSH 	False		
89:	CALLX	39 :SHOWCURSOR		1
90:	POPN 	2		
91:	CALLX	11 :CVMLIGHT		0
92:	POP  			G7:LUCE
93:	CALLM	G7:LUCE	m_0	0
94:	POPN 	1		
95:	GET  	G20:AMBIENT_LIGHT	0	BP(1)
96:	GET  	G20:AMBIENT_LIGHT	1	BP(2)
97:	GET  	G20:AMBIENT_LIGHT	2	BP(3)
98:	PUSH 	BP(3)		
99:	PUSH 	BP(2)		
100:	PUSH 	BP(1)		
101:	CALLM	G7:LUCE	m_1	3
102:	POPN 	4		
103:	GET  	G21:DIFFUSE_LIGHT	0	BP(1)
104:	GET  	G21:DIFFUSE_LIGHT	1	BP(2)
105:	GET  	G21:DIFFUSE_LIGHT	2	BP(3)
106:	PUSH 	BP(3)		
107:	PUSH 	BP(2)		
108:	PUSH 	BP(1)		
109:	CALLM	G7:LUCE	m_2	3
110:	POPN 	4		
111:	GET  	G22:SPECULAR_LIGHT	0	BP(1)
112:	GET  	G22:SPECULAR_LIGHT	1	BP(2)
113:	GET  	G22:SPECULAR_LIGHT	2	BP(3)
114:	PUSH 	BP(3)		
115:	PUSH 	BP(2)		
116:	PUSH 	BP(1)		
117:	CALLM	G7:LUCE	m_3	3
118:	POPN 	4		
119:	PUSH 	G9:POSL		
120:	CALLM	G7:LUCE	m_4	1
121:	POPN 	2		
122:	PUSH 	10		
123:	PUSH 	30		
124:	PUSH 	11		
125:	CALLX	17 :CVMNEWMESH		3
126:	POP  			G12:M_LUCE
127:	POPN 	3		
128:	PUSH 	1		
129:	CALLM	G12:M_LUCE	m_5	1
130:	POPN 	2		
131:	PUSH 	G12:M_LUCE		
132:	CALLX	18 :CVMOBJ		1
133:	POP  			G13:O_LUCE
134:	POPN 	1		
135:	PUSH 	G9:POSL		
136:	CALLM	G13:O_LUCE	m_4	1
137:	POPN 	2		
138:	PUSH 	10		
139:	PUSH 	30		
140:	PUSH 	11		
141:	CALLX	17 :CVMNEWMESH		3
142:	POP  			G14:M_SFERA
143:	POPN 	3		
144:	PUSH 	10		
145:	CALLM	G14:M_SFERA	m_5	1
146:	POPN 	2		
147:	PUSH 	<cStr5 "simpson.jpg">		
148:	CALLX	19 :CVMTEXTURE		1
149:	POP  			G29:TEXSIMPSON
150:	POPN 	1		
151:	PUSH 	2896		
152:	CALLX	27 :GLGET		1
153:	POP  			G23:LIGHT_ENABLED
154:	POPN 	1		
155:	PUSH 	3553		
156:	CALLX	27 :GLGET		1
157:	POP  			G24:TEXTURE_ENABLED
158:	POPN 	1		
159:	MOV  	False		G25:WIREFRAME_ENABLED
160:	PUSH 	3042		
161:	CALLX	25 :GLENABLE		1
162:	POPN 	2		
163:	CALLX	12 :CVMMATERIAL		0
164:	POP  			G15:MAT
165:	PUSH 	60		
166:	CALLX	38 :SETFRAMERATE		1
167:	POPN 	2		
168:	RET  	Void		
169:	PUSHN	0		
170:	CALL 	Quad:393 :KEYBOARDMANAGER		
171:	POPN 	1		
172:	CALL 	Quad:750 :CAMERAMOVEMOUSE		
173:	POPN 	1		
174:	PUSH 	False		
175:	CALLX	39 :SHOWCURSOR		1
176:	POPN 	2		
177:	CALLX	35 :SCENEBEGIN		0
178:	POPN 	1		
179:	CALL 	Quad:863 :DRAWGRID		
180:	POPN 	1		
181:	PUSH 	1		
182:	PUSH 	3		
183:	CALL 	Quad:202 :DRAWQUAD		
184:	POPN 	3		
185:	PUSH 	G21:DIFFUSE_LIGHT		
186:	CALLX	23 :GLCOLOR		1
187:	POPN 	2		
188:	PUSH 	1024		
189:	CALLM	G13:O_LUCE	m_6	1
190:	POPN 	2		
191:	CALLX	36 :SCENEEND		0
192:	POPN 	1		
193:	CALL 	Quad:935 :DRAWTEXTLAYER		
194:	POPN 	1		
195:	RET  	Void		
196:	PUSHN	0		
197:	RET  	Void		
198:	PUSHN	0		
199:	RET  	Void		
200:	PUSHN	0		
201:	RET  	Void		
202:	PUSHN	13		
203:	PUSH 	2896		
204:	CALLX	27 :GLGET		1
205:	POP  			BP(1)
206:	POPN 	1		
207:	PUSH 	3553		
208:	CALLX	27 :GLGET		1
209:	POP  			BP(2)
210:	POPN 	1		
211:	JNB  	G23:LIGHT_ENABLED		Quad:243
212:	PUSH 	2896		
213:	CALLX	25 :GLENABLE		1
214:	POPN 	2		
215:	PUSH 	G16:AMBIENT_COLOR		
216:	PUSH 	4608		
217:	PUSH 	1028		
218:	CALLX	29 :GLMATERIAL		3
219:	POPN 	4		
220:	PUSH 	G17:DIFFUSE_COLOR		
221:	PUSH 	4609		
222:	PUSH 	1028		
223:	CALLX	29 :GLMATERIAL		3
224:	POPN 	4		
225:	PUSH 	G18:SPECULAR_COLOR		
226:	PUSH 	4610		
227:	PUSH 	1028		
228:	CALLX	29 :GLMATERIAL		3
229:	POPN 	4		
230:	PUSH 	G19:SHININESS		
231:	PUSH 	5633		
232:	PUSH 	1028		
233:	CALLX	29 :GLMATERIAL		3
234:	POPN 	4		
235:	MSET 	G16:AMBIENT_COLOR	m_7	G15:MAT
236:	MSET 	G17:DIFFUSE_COLOR	m_8	G15:MAT
237:	MSET 	G18:SPECULAR_COLOR	m_9	G15:MAT
238:	MSET 	G19:SHININESS	m_10	G15:MAT
239:	PUSH 	G15:MAT		
240:	CALLM	G14:M_SFERA	m_11	1
241:	POPN 	2		
242:	JMP  			Quad:249
243:	PUSH 	2896		
244:	CALLX	24 :GLDISABLE		1
245:	POPN 	2		
246:	PUSH 	G17:DIFFUSE_COLOR		
247:	CALLX	23 :GLCOLOR		1
248:	POPN 	2		
249:	JNB  	G24:TEXTURE_ENABLED		Quad:265
250:	PUSH 	3553		
251:	CALLX	25 :GLENABLE		1
252:	POPN 	2		
253:	PUSH 	0		
254:	PUSH 	1		
255:	PUSH 	G29:TEXSIMPSON		
256:	CALLX	37 :SETACTIVETEXTURE		3
257:	POPN 	4		
258:	PUSH 	G29:TEXSIMPSON		
259:	CALLM	G15:MAT	m_12	1
260:	POPN 	2		
261:	PUSH 	G15:MAT		
262:	CALLM	G14:M_SFERA	m_11	1
263:	POPN 	2		
264:	JMP  			Quad:274
265:	PUSH 	3553		
266:	CALLX	24 :GLDISABLE		1
267:	POPN 	2		
268:	PUSH 	0		
269:	CALLM	G15:MAT	m_12	1
270:	POPN 	2		
271:	PUSH 	G15:MAT		
272:	CALLM	G14:M_SFERA	m_11	1
273:	POPN 	2		
274:	ADD  	P1:SIZE	P1:SIZE	BP(4)
275:	PUSH 	G26:SEGS		
276:	CALLX	41 :TOFLOAT		1
277:	POP  			BP(5)
278:	POPN 	1		
279:	DIV  	BP(4)	BP(5)	BP(3)
280:	JNB  	G25:WIREFRAME_ENABLED		Quad:286
281:	PUSH 	6913		
282:	PUSH 	1028		
283:	CALLX	31 :GLPOLYGONMODE		2
284:	POPN 	3		
285:	JMP  			Quad:290
286:	PUSH 	6914		
287:	PUSH 	1028		
288:	CALLX	31 :GLPOLYGONMODE		2
289:	POPN 	3		
290:	JNEQ 	G28:ACTIVE_OBJECT	1	Quad:294
291:	CALLM	G14:M_SFERA	m_6	0
292:	POPN 	1		
293:	JMP  			Quad:376
294:	PUSH 	7		
295:	CALLX	22 :GLBEGIN		1
296:	POPN 	2		
297:	PUSH 	1		
298:	PUSH 	0		
299:	PUSH 	0		
300:	CALLX	30 :GLNORMAL		3
301:	POPN 	4		
302:	MOV  	0		BP(4)
303:	JGEQ 	BP(4)	G26:SEGS	Quad:374
304:	MOV  	0		BP(5)
305:	JGEQ 	BP(5)	G26:SEGS	Quad:372
306:	PUSH 	1		
307:	PUSH 	0		
308:	CALLX	32 :GLTEXCOORD		2
309:	POPN 	3		
310:	NEG  	P1:SIZE		BP(6)
311:	MUL  	BP(4)	BP(3)	BP(7)
312:	ADD  	BP(7)		BP(6)
313:	NEG  	P1:SIZE		BP(7)
314:	MUL  	BP(5)	BP(3)	BP(8)
315:	ADD  	BP(8)		BP(7)
316:	PUSH 	0		
317:	PUSH 	BP(7)		
318:	PUSH 	BP(6)		
319:	CALLX	33 :GLVERTEX		3
320:	POPN 	4		
321:	PUSH 	1		
322:	PUSH 	1		
323:	CALLX	32 :GLTEXCOORD		2
324:	POPN 	3		
325:	NEG  	P1:SIZE		BP(6)
326:	ADD  	BP(4)	1	BP(7)
327:	MUL  	BP(3)		BP(7)
328:	ADD  	BP(7)		BP(6)
329:	NEG  	P1:SIZE		BP(7)
330:	MUL  	BP(5)	BP(3)	BP(8)
331:	ADD  	BP(8)		BP(7)
332:	PUSH 	0		
333:	PUSH 	BP(7)		
334:	PUSH 	BP(6)		
335:	CALLX	33 :GLVERTEX		3
336:	POPN 	4		
337:	PUSH 	0		
338:	PUSH 	1		
339:	CALLX	32 :GLTEXCOORD		2
340:	POPN 	3		
341:	NEG  	P1:SIZE		BP(6)
342:	ADD  	BP(4)	1	BP(7)
343:	MUL  	BP(3)		BP(7)
344:	ADD  	BP(7)		BP(6)
345:	NEG  	P1:SIZE		BP(7)
346:	ADD  	BP(5)	1	BP(8)
347:	MUL  	BP(3)		BP(8)
348:	ADD  	BP(8)		BP(7)
349:	PUSH 	0		
350:	PUSH 	BP(7)		
351:	PUSH 	BP(6)		
352:	CALLX	33 :GLVERTEX		3
353:	POPN 	4		
354:	PUSH 	0		
355:	PUSH 	0		
356:	CALLX	32 :GLTEXCOORD		2
357:	POPN 	3		
358:	NEG  	P1:SIZE		BP(6)
359:	MUL  	BP(4)	BP(3)	BP(7)
360:	ADD  	BP(7)		BP(6)
361:	NEG  	P1:SIZE		BP(7)
362:	ADD  	BP(5)	1	BP(8)
363:	MUL  	BP(3)		BP(8)
364:	ADD  	BP(8)		BP(7)
365:	PUSH 	0		
366:	PUSH 	BP(7)		
367:	PUSH 	BP(6)		
368:	CALLX	33 :GLVERTEX		3
369:	POPN 	4		
370:	INC  			BP(5)
371:	JMP  			Quad:305
372:	INC  			BP(4)
373:	JMP  			Quad:303
374:	CALLX	26 :GLEND		0
375:	POPN 	1		
376:	JNB  	BP(1)		Quad:381
377:	PUSH 	2896		
378:	CALLX	25 :GLENABLE		1
379:	POPN 	2		
380:	JMP  			Quad:384
381:	PUSH 	2896		
382:	CALLX	24 :GLDISABLE		1
383:	POPN 	2		
384:	JNB  	BP(2)		Quad:389
385:	PUSH 	3553		
386:	CALLX	25 :GLENABLE		1
387:	POPN 	2		
388:	RET  	Void		
389:	PUSH 	3553		
390:	CALLX	24 :GLDISABLE		1
391:	POPN 	2		
392:	RET  	Void		
393:	PUSHN	20		
394:	PUSH 	33		
395:	CALLX	34 :KEYPRESSED		1
396:	POP  			BP(1)
397:	POPN 	1		
398:	JNB  	BP(1)		Quad:400
399:	ADD  	0.1		G8:RADIUS
400:	PUSH 	34		
401:	CALLX	34 :KEYPRESSED		1
402:	POP  			BP(1)
403:	POPN 	1		
404:	JNB  	BP(1)		Quad:406
405:	SUB  	0.1		G8:RADIUS
406:	JGEQ 	G8:RADIUS	0	Quad:408
407:	MOV  	0		G8:RADIUS
408:	PUSH 	37		
409:	CALLX	34 :KEYPRESSED		1
410:	POP  			BP(1)
411:	POPN 	1		
412:	JNB  	BP(1)		Quad:414
413:	SUB  	0.5		G11:ANG_ORIZ
414:	PUSH 	39		
415:	CALLX	34 :KEYPRESSED		1
416:	POP  			BP(1)
417:	POPN 	1		
418:	JNB  	BP(1)		Quad:420
419:	ADD  	0.5		G11:ANG_ORIZ
420:	PUSH 	38		
421:	CALLX	34 :KEYPRESSED		1
422:	POP  			BP(1)
423:	POPN 	1		
424:	JNB  	BP(1)		Quad:426
425:	ADD  	0.5		G10:ANG_VERT
426:	PUSH 	40		
427:	CALLX	34 :KEYPRESSED		1
428:	POP  			BP(1)
429:	POPN 	1		
430:	JNB  	BP(1)		Quad:432
431:	SUB  	0.5		G10:ANG_VERT
432:	JGEQ 	G11:ANG_ORIZ	-90	Quad:435
433:	MOV  	-90		G11:ANG_ORIZ
434:	JMP  			Quad:437
435:	JLEQ 	G11:ANG_ORIZ	90	Quad:437
436:	MOV  	90		G11:ANG_ORIZ
437:	JLEQ 	G10:ANG_VERT	0	Quad:440
438:	MOV  	0		G10:ANG_VERT
439:	JMP  			Quad:442
440:	JGEQ 	G10:ANG_VERT	-180	Quad:442
441:	MOV  	-180		G10:ANG_VERT
442:	VNEW 	3		BP(1)
443:	SET  	G8:RADIUS	1	BP(1)
444:	MOV  	BP(1)		G9:POSL
445:	NEG  	G10:ANG_VERT		BP(1)
446:	PUSH 	G9:POSL		
447:	PUSH 	0		
448:	PUSH 	0		
449:	PUSH 	1		
450:	PUSH 	BP(1)		
451:	CALLX	42 :VECTORROTATE		5
452:	POP  			G9:POSL
453:	POPN 	5		
454:	VNEW 	3		BP(1)
455:	GET  	G9:POSL	0	BP(2)
456:	SET  	BP(2)	0	BP(1)
457:	GET  	G9:POSL	2	BP(2)
458:	SET  	BP(2)	2	BP(1)
459:	PUSH 	BP(1)		
460:	PUSH 	0		
461:	PUSH 	1		
462:	PUSH 	0		
463:	PUSH 	G11:ANG_ORIZ		
464:	CALLX	42 :VECTORROTATE		5
465:	POP  			BP(1)
466:	POPN 	5		
467:	GET  	G9:POSL	1	BP(2)
468:	SET  	BP(2)	1	BP(1)
469:	MOV  	BP(1)		G9:POSL
470:	PUSH 	G9:POSL		
471:	CALLM	G7:LUCE	m_4	1
472:	POPN 	2		
473:	PUSH 	G9:POSL		
474:	CALLM	G13:O_LUCE	m_4	1
475:	POPN 	2		
476:	PUSH 	<cStr6 "L">		
477:	CALL 	Quad:914 :KEYSTATUS		
478:	POP  			BP(2)
479:	POPN 	1		
480:	JNB  	BP(2)		Quad:486
481:	JB   	G23:LIGHT_ENABLED		Quad:484
482:	MOV  	True		BP(2)
483:	JMP  			Quad:485
484:	MOV  	False		BP(2)
485:	MOV  	BP(2)		G23:LIGHT_ENABLED
486:	PUSH 	<cStr7 "T">		
487:	CALL 	Quad:914 :KEYSTATUS		
488:	POP  			BP(3)
489:	POPN 	1		
490:	JNB  	BP(3)		Quad:496
491:	JB   	G24:TEXTURE_ENABLED		Quad:494
492:	MOV  	True		BP(3)
493:	JMP  			Quad:495
494:	MOV  	False		BP(3)
495:	MOV  	BP(3)		G24:TEXTURE_ENABLED
496:	PUSH 	<cStr8 "Z">		
497:	CALL 	Quad:914 :KEYSTATUS		
498:	POP  			BP(4)
499:	POPN 	1		
500:	JNB  	BP(4)		Quad:506
501:	JB   	G25:WIREFRAME_ENABLED		Quad:504
502:	MOV  	True		BP(4)
503:	JMP  			Quad:505
504:	MOV  	False		BP(4)
505:	MOV  	BP(4)		G25:WIREFRAME_ENABLED
506:	PUSH 	<cStr9 "O">		
507:	CALL 	Quad:914 :KEYSTATUS		
508:	POP  			BP(5)
509:	POPN 	1		
510:	JNB  	BP(5)		Quad:512
511:	SUB  	1	G28:ACTIVE_OBJECT	G28:ACTIVE_OBJECT
512:	PUSH 	<cStr10 "1">		
513:	CALLX	34 :KEYPRESSED		1
514:	POP  			BP(5)
515:	POPN 	1		
516:	JNB  	BP(5)		Quad:518
517:	MOV  	0		G27:ACTIVE_COMPONENT
518:	PUSH 	<cStr11 "2">		
519:	CALLX	34 :KEYPRESSED		1
520:	POP  			BP(5)
521:	POPN 	1		
522:	JNB  	BP(5)		Quad:524
523:	MOV  	1		G27:ACTIVE_COMPONENT
524:	PUSH 	<cStr12 "3">		
525:	CALLX	34 :KEYPRESSED		1
526:	POP  			BP(5)
527:	POPN 	1		
528:	JNB  	BP(5)		Quad:530
529:	MOV  	2		G27:ACTIVE_COMPONENT
530:	PUSH 	<cStr13 "4">		
531:	CALLX	34 :KEYPRESSED		1
532:	POP  			BP(5)
533:	POPN 	1		
534:	JNB  	BP(5)		Quad:536
535:	MOV  	3		G27:ACTIVE_COMPONENT
536:	PUSH 	<cStr14 "5">		
537:	CALLX	34 :KEYPRESSED		1
538:	POP  			BP(5)
539:	POPN 	1		
540:	JNB  	BP(5)		Quad:542
541:	MOV  	4		G27:ACTIVE_COMPONENT
542:	PUSH 	<cStr15 "6">		
543:	CALLX	34 :KEYPRESSED		1
544:	POP  			BP(5)
545:	POPN 	1		
546:	JNB  	BP(5)		Quad:548
547:	MOV  	5		G27:ACTIVE_COMPONENT
548:	PUSH 	<cStr16 "7">		
549:	CALLX	34 :KEYPRESSED		1
550:	POP  			BP(5)
551:	POPN 	1		
552:	JNB  	BP(5)		Quad:554
553:	MOV  	6		G27:ACTIVE_COMPONENT
554:	PUSH 	<cStr17 "8">		
555:	CALLX	34 :KEYPRESSED		1
556:	POP  			BP(5)
557:	POPN 	1		
558:	JNB  	BP(5)		Quad:560
559:	MOV  	7		G27:ACTIVE_COMPONENT
560:	MOV  	0		BP(5)
561:	MOV  	0		BP(6)
562:	MOV  	0		BP(7)
563:	MOV  	0		BP(8)
564:	PUSH 	<cStr18 "Q">		
565:	CALLX	34 :KEYPRESSED		1
566:	POP  			BP(9)
567:	POPN 	1		
568:	JNB  	BP(9)		Quad:570
569:	ADD  	0.01		BP(5)
570:	PUSH 	<cStr19 "A">		
571:	CALLX	34 :KEYPRESSED		1
572:	POP  			BP(9)
573:	POPN 	1		
574:	JNB  	BP(9)		Quad:576
575:	SUB  	0.01		BP(5)
576:	PUSH 	<cStr20 "W">		
577:	CALLX	34 :KEYPRESSED		1
578:	POP  			BP(9)
579:	POPN 	1		
580:	JNB  	BP(9)		Quad:582
581:	ADD  	0.01		BP(6)
582:	PUSH 	<cStr21 "S">		
583:	CALLX	34 :KEYPRESSED		1
584:	POP  			BP(9)
585:	POPN 	1		
586:	JNB  	BP(9)		Quad:588
587:	SUB  	0.01		BP(6)
588:	PUSH 	<cStr22 "E">		
589:	CALLX	34 :KEYPRESSED		1
590:	POP  			BP(9)
591:	POPN 	1		
592:	JNB  	BP(9)		Quad:594
593:	ADD  	0.01		BP(7)
594:	PUSH 	<cStr23 "D">		
595:	CALLX	34 :KEYPRESSED		1
596:	POP  			BP(9)
597:	POPN 	1		
598:	JNB  	BP(9)		Quad:600
599:	SUB  	0.01		BP(7)
600:	PUSH 	<cStr24 "R">		
601:	CALLX	34 :KEYPRESSED		1
602:	POP  			BP(9)
603:	POPN 	1		
604:	JNB  	BP(9)		Quad:606
605:	ADD  	0.01		BP(8)
606:	PUSH 	<cStr25 "F">		
607:	CALLX	34 :KEYPRESSED		1
608:	POP  			BP(9)
609:	POPN 	1		
610:	JNB  	BP(9)		Quad:612
611:	SUB  	0.01		BP(8)
612:	JNV  	S34:$STATIC$_00000001_#FLAG_000035#		Quad:618
613:	MOV  	0		S30:$STATIC$_00000004_PRECX
614:	MOV  	0		S31:$STATIC$_00000002_$VALUE_PRECX$
615:	MOV  	0		S32:$STATIC$_00000005_PRECY
616:	MOV  	0		S33:$STATIC$_00000003_$VALUE_PRECY$
617:	MOV  	1		S34:$STATIC$_00000001_#FLAG_000035#
618:	MGET 	G0:MOUSE	m_13	S30:$STATIC$_00000004_PRECX
619:	MGET 	G0:MOUSE	m_14	S32:$STATIC$_00000005_PRECY
620:	CALLX	0 :CAMERAGETMATRIX		0
621:	POPN 	1		
622:	CALLX	1 :CAMERAGETPOSITION		0
623:	POP  			BP(9)
624:	PUSH 	<cStr20 "W">		
625:	CALLX	34 :KEYPRESSED		1
626:	POP  			BP(10)
627:	POPN 	1		
628:	JNB  	BP(10)		Quad:633
629:	CALLX	4 :CAMERAGETZAXIS		0
630:	POP  			BP(10)
631:	MUL  	0.1		BP(10)
632:	SUB  	BP(10)		BP(9)
633:	PUSH 	<cStr19 "A">		
634:	CALLX	34 :KEYPRESSED		1
635:	POP  			BP(10)
636:	POPN 	1		
637:	JNB  	BP(10)		Quad:642
638:	CALLX	2 :CAMERAGETXAXIS		0
639:	POP  			BP(10)
640:	MUL  	0.1		BP(10)
641:	SUB  	BP(10)		BP(9)
642:	PUSH 	<cStr21 "S">		
643:	CALLX	34 :KEYPRESSED		1
644:	POP  			BP(10)
645:	POPN 	1		
646:	JNB  	BP(10)		Quad:651
647:	CALLX	4 :CAMERAGETZAXIS		0
648:	POP  			BP(10)
649:	MUL  	0.1		BP(10)
650:	ADD  	BP(10)		BP(9)
651:	PUSH 	<cStr23 "D">		
652:	CALLX	34 :KEYPRESSED		1
653:	POP  			BP(10)
654:	POPN 	1		
655:	JNB  	BP(10)		Quad:660
656:	CALLX	2 :CAMERAGETXAXIS		0
657:	POP  			BP(10)
658:	MUL  	0.1		BP(10)
659:	ADD  	BP(10)		BP(9)
660:	MOV  	<cVct26 [ 0 , 5 , 0 ]>		BP(10)
661:	MGET 	BP(9)	m_13	BP(11)
662:	SET  	BP(11)	0	BP(10)
663:	MGET 	BP(9)	m_15	BP(11)
664:	SET  	BP(11)	2	BP(10)
665:	PUSH 	BP(10)		
666:	CALLX	7 :CAMERASETPOSITION		1
667:	POPN 	2		
668:	JEQ  	G27:ACTIVE_COMPONENT	0	Quad:677
669:	JEQ  	G27:ACTIVE_COMPONENT	1	Quad:684
670:	JEQ  	G27:ACTIVE_COMPONENT	2	Quad:691
671:	JEQ  	G27:ACTIVE_COMPONENT	3	Quad:698
672:	JEQ  	G27:ACTIVE_COMPONENT	7	Quad:701
673:	JEQ  	G27:ACTIVE_COMPONENT	4	Quad:706
674:	JEQ  	G27:ACTIVE_COMPONENT	5	Quad:712
675:	JEQ  	G27:ACTIVE_COMPONENT	6	Quad:718
676:	JMP  			Quad:723
677:	VNEW 	4		BP(10)
678:	SET  	BP(5)	0	BP(10)
679:	SET  	BP(6)	1	BP(10)
680:	SET  	BP(7)	2	BP(10)
681:	SET  	BP(8)	3	BP(10)
682:	ADD  	BP(10)		G16:AMBIENT_COLOR
683:	JMP  			Quad:723
684:	VNEW 	4		BP(10)
685:	SET  	BP(5)	0	BP(10)
686:	SET  	BP(6)	1	BP(10)
687:	SET  	BP(7)	2	BP(10)
688:	SET  	BP(8)	3	BP(10)
689:	ADD  	BP(10)		G17:DIFFUSE_COLOR
690:	JMP  			Quad:723
691:	VNEW 	4		BP(10)
692:	SET  	BP(5)	0	BP(10)
693:	SET  	BP(6)	1	BP(10)
694:	SET  	BP(7)	2	BP(10)
695:	SET  	BP(8)	3	BP(10)
696:	ADD  	BP(10)		G18:SPECULAR_COLOR
697:	JMP  			Quad:723
698:	MUL  	BP(5)	100	BP(10)
699:	ADD  	BP(10)		G19:SHININESS
700:	JMP  			Quad:723
701:	MUL  	BP(5)	100	BP(10)
702:	ADD  	BP(10)		G26:SEGS
703:	JGEQ 	G26:SEGS	1	Quad:723
704:	MOV  	1		G26:SEGS
705:	JMP  			Quad:723
706:	VNEW 	3		BP(10)
707:	SET  	BP(5)	0	BP(10)
708:	SET  	BP(6)	1	BP(10)
709:	SET  	BP(7)	2	BP(10)
710:	ADD  	BP(10)		G20:AMBIENT_LIGHT
711:	JMP  			Quad:723
712:	VNEW 	3		BP(10)
713:	SET  	BP(5)	0	BP(10)
714:	SET  	BP(6)	1	BP(10)
715:	SET  	BP(7)	2	BP(10)
716:	ADD  	BP(10)		G21:DIFFUSE_LIGHT
717:	JMP  			Quad:723
718:	VNEW 	3		BP(10)
719:	SET  	BP(5)	0	BP(10)
720:	SET  	BP(6)	1	BP(10)
721:	SET  	BP(7)	2	BP(10)
722:	ADD  	BP(10)		G22:SPECULAR_LIGHT
723:	CALL 	Quad:1191 :SATURATE		
724:	POPN 	1		
725:	GET  	G20:AMBIENT_LIGHT	0	BP(10)
726:	GET  	G20:AMBIENT_LIGHT	1	BP(11)
727:	GET  	G20:AMBIENT_LIGHT	2	BP(12)
728:	PUSH 	BP(12)		
729:	PUSH 	BP(11)		
730:	PUSH 	BP(10)		
731:	CALLM	G7:LUCE	m_1	3
732:	POPN 	4		
733:	GET  	G21:DIFFUSE_LIGHT	0	BP(10)
734:	GET  	G21:DIFFUSE_LIGHT	1	BP(11)
735:	GET  	G21:DIFFUSE_LIGHT	2	BP(12)
736:	PUSH 	BP(12)		
737:	PUSH 	BP(11)		
738:	PUSH 	BP(10)		
739:	CALLM	G7:LUCE	m_2	3
740:	POPN 	4		
741:	GET  	G22:SPECULAR_LIGHT	0	BP(10)
742:	GET  	G22:SPECULAR_LIGHT	1	BP(11)
743:	GET  	G22:SPECULAR_LIGHT	2	BP(12)
744:	PUSH 	BP(12)		
745:	PUSH 	BP(11)		
746:	PUSH 	BP(10)		
747:	CALLM	G7:LUCE	m_3	3
748:	POPN 	4		
749:	RET  	Void		
750:	PUSHN	10		
751:	JNV  	S39:$STATIC$_00000006_#FLAG_000040#		Quad:757
752:	MOV  	False		S35:$STATIC$_00000013_INMOUSER
753:	MOV  	False		S36:$STATIC$_00000009_$VALUE_INMOUSER$
754:	MOV  	False		S37:$STATIC$_00000012_INMOUSEL
755:	MOV  	False		S38:$STATIC$_00000008_$VALUE_INMOUSEL$
756:	MOV  	1		S39:$STATIC$_00000006_#FLAG_000040#
757:	JNV  	S44:$STATIC$_00000007_#FLAG_000045#		Quad:763
758:	MOV  	0		S40:$STATIC$_00000014_PRECX
759:	MOV  	0		S41:$STATIC$_00000010_$VALUE_PRECX$
760:	MOV  	0		S42:$STATIC$_00000015_PRECY
761:	MOV  	0		S43:$STATIC$_00000011_$VALUE_PRECY$
762:	MOV  	1		S44:$STATIC$_00000007_#FLAG_000045#
763:	MOV  	0.001		BP(2)
764:	MOV  	0.01		BP(1)
765:	MGET 	G0:MOUSE	m_13	BP(3)
766:	SUB  	S40:$STATIC$_00000014_PRECX		BP(3)
767:	MUL  	BP(1)		BP(3)
768:	PUSH 	0		
769:	PUSH 	1		
770:	PUSH 	0		
771:	PUSH 	BP(3)		
772:	CALLX	5 :CAMERAROTATE		4
773:	POPN 	5		
774:	MGET 	G0:MOUSE	m_14	BP(3)
775:	SUB  	S42:$STATIC$_00000015_PRECY		BP(3)
776:	MUL  	BP(1)		BP(3)
777:	PUSH 	0		
778:	PUSH 	0		
779:	PUSH 	1		
780:	PUSH 	BP(3)		
781:	CALLX	6 :CAMERAROTATEABS		4
782:	POPN 	5		
783:	PUSH 	0		
784:	PUSH 	0		
785:	CALLM	G0:MOUSE	m_16	2
786:	POPN 	3		
787:	MGET 	G0:MOUSE	m_13	S40:$STATIC$_00000014_PRECX
788:	MGET 	G0:MOUSE	m_14	S42:$STATIC$_00000015_PRECY
789:	MGET 	G0:MOUSE	m_17	BP(3)
790:	JNB  	BP(3)		Quad:820
791:	MGET 	G0:MOUSE	m_18	BP(3)
792:	JB   	BP(3)		Quad:820
793:	JNB  	S37:$STATIC$_00000012_INMOUSEL		Quad:815
794:	MGET 	G0:MOUSE	m_13	BP(3)
795:	SUB  	S40:$STATIC$_00000014_PRECX		BP(3)
796:	MUL  	BP(1)		BP(3)
797:	PUSH 	0		
798:	PUSH 	1		
799:	PUSH 	0		
800:	PUSH 	BP(3)		
801:	CALLX	5 :CAMERAROTATE		4
802:	POPN 	5		
803:	MGET 	G0:MOUSE	m_14	BP(3)
804:	SUB  	S42:$STATIC$_00000015_PRECY		BP(3)
805:	MUL  	BP(1)		BP(3)
806:	PUSH 	0		
807:	PUSH 	0		
808:	PUSH 	1		
809:	PUSH 	BP(3)		
810:	CALLX	6 :CAMERAROTATEABS		4
811:	POPN 	5		
812:	MGET 	G0:MOUSE	m_13	S40:$STATIC$_00000014_PRECX
813:	MGET 	G0:MOUSE	m_14	S42:$STATIC$_00000015_PRECY
814:	JMP  			Quad:817
815:	MGET 	G0:MOUSE	m_13	S40:$STATIC$_00000014_PRECX
816:	MGET 	G0:MOUSE	m_14	S42:$STATIC$_00000015_PRECY
817:	MOV  	True		S37:$STATIC$_00000012_INMOUSEL
818:	MOV  	False		S35:$STATIC$_00000013_INMOUSER
819:	RET  	Void		
820:	MGET 	G0:MOUSE	m_18	BP(3)
821:	JNB  	BP(3)		Quad:860
822:	JNB  	S35:$STATIC$_00000013_INMOUSER		Quad:855
823:	CALLX	0 :CAMERAGETMATRIX		0
824:	POPN 	1		
825:	CALLX	1 :CAMERAGETPOSITION		0
826:	POP  			BP(3)
827:	MGET 	G0:MOUSE	m_17	BP(4)
828:	JB   	BP(4)		Quad:844
829:	CALLX	4 :CAMERAGETZAXIS		0
830:	POP  			BP(4)
831:	MGET 	G0:MOUSE	m_14	BP(5)
832:	SUB  	S42:$STATIC$_00000015_PRECY		BP(5)
833:	MUL  	BP(5)		BP(4)
834:	MUL  	BP(2)		BP(4)
835:	CALLX	2 :CAMERAGETXAXIS		0
836:	POP  			BP(5)
837:	MGET 	G0:MOUSE	m_13	BP(6)
838:	SUB  	S40:$STATIC$_00000014_PRECX		BP(6)
839:	MUL  	BP(6)		BP(5)
840:	MUL  	BP(2)		BP(5)
841:	ADD  	BP(5)		BP(4)
842:	ADD  	BP(4)		BP(3)
843:	JMP  			Quad:851
844:	CALLX	3 :CAMERAGETYAXIS		0
845:	POP  			BP(4)
846:	MGET 	G0:MOUSE	m_14	BP(5)
847:	SUB  	S42:$STATIC$_00000015_PRECY		BP(5)
848:	MUL  	BP(5)		BP(4)
849:	MUL  	BP(2)		BP(4)
850:	SUB  	BP(4)		BP(3)
851:	PUSH 	BP(3)		
852:	CALLX	7 :CAMERASETPOSITION		1
853:	POPN 	2		
854:	JMP  			Quad:857
855:	MGET 	G0:MOUSE	m_13	S40:$STATIC$_00000014_PRECX
856:	MGET 	G0:MOUSE	m_14	S42:$STATIC$_00000015_PRECY
857:	MOV  	True		S35:$STATIC$_00000013_INMOUSER
858:	MOV  	False		S37:$STATIC$_00000012_INMOUSEL
859:	RET  	Void		
860:	MOV  	False		S35:$STATIC$_00000013_INMOUSER
861:	MOV  	False		S37:$STATIC$_00000012_INMOUSEL
862:	RET  	Void		
863:	PUSHN	2		
864:	PUSH 	1		
865:	CALLX	28 :GLLINEWIDTH		1
866:	POPN 	2		
867:	PUSH 	2896		
868:	CALLX	24 :GLDISABLE		1
869:	POPN 	2		
870:	PUSH 	3553		
871:	CALLX	24 :GLDISABLE		1
872:	POPN 	2		
873:	PUSH 	0.5		
874:	PUSH 	0.5		
875:	PUSH 	0.5		
876:	CALLX	23 :GLCOLOR		3
877:	POPN 	4		
878:	PUSH 	1		
879:	CALLX	22 :GLBEGIN		1
880:	POPN 	2		
881:	MOV  	-100		BP(1)
882:	JGR  	BP(1)	100	Quad:905
883:	PUSH 	100		
884:	PUSH 	0		
885:	PUSH 	BP(1)		
886:	CALLX	33 :GLVERTEX		3
887:	POPN 	4		
888:	PUSH 	-100		
889:	PUSH 	0		
890:	PUSH 	BP(1)		
891:	CALLX	33 :GLVERTEX		3
892:	POPN 	4		
893:	PUSH 	BP(1)		
894:	PUSH 	0		
895:	PUSH 	100		
896:	CALLX	33 :GLVERTEX		3
897:	POPN 	4		
898:	PUSH 	BP(1)		
899:	PUSH 	0		
900:	PUSH 	-100		
901:	CALLX	33 :GLVERTEX		3
902:	POPN 	4		
903:	ADD  	10		BP(1)
904:	JMP  			Quad:882
905:	CALLX	26 :GLEND		0
906:	POPN 	1		
907:	PUSH 	2896		
908:	CALLX	25 :GLENABLE		1
909:	POPN 	2		
910:	PUSH 	3553		
911:	CALLX	25 :GLENABLE		1
912:	POPN 	2		
913:	RET  	Void		
914:	PUSHN	1		
915:	VTYPE	P1:KEYCODE		BP(1)
916:	JNEQ 	BP(1)	<cStr21 "S">	Quad:918
917:	ASC  	P1:KEYCODE		P1:KEYCODE
918:	JNV  	S47:$STATIC$_00000016_#FLAG_000048#		Quad:923
919:	VNEW 	255		BP(1)
920:	MOV  	BP(1)		S45:$STATIC$_00000018_KEYS_STATI
921:	MOV  	BP(1)		S46:$STATIC$_00000017_$VALUE_KEYS_STATI$
922:	MOV  	1		S47:$STATIC$_00000016_#FLAG_000048#
923:	PUSH 	P1:KEYCODE		
924:	CALLX	34 :KEYPRESSED		1
925:	POP  			BP(1)
926:	POPN 	1		
927:	JNB  	BP(1)		Quad:933
928:	GET  	S45:$STATIC$_00000018_KEYS_STATI	P1:KEYCODE	BP(1)
929:	JNEQ 	BP(1)	0	Quad:932
930:	SET  	1	P1:KEYCODE	S45:$STATIC$_00000018_KEYS_STATI
931:	RET  	True		
932:	RET  	False		
933:	SET  	0	P1:KEYCODE	S45:$STATIC$_00000018_KEYS_STATI
934:	RET  	False		
935:	PUSHN	10		
936:	MOV  	<cStr27 "">		BP(1)
937:	JNB  	G23:LIGHT_ENABLED		Quad:940
938:	MOV  	<cStr28 "Lighting abilitato">		BP(2)
939:	JMP  			Quad:941
940:	MOV  	<cStr29 "Lighting disabilitato">		BP(2)
941:	PUSH 	BP(2)		
942:	PUSH 	0.98		
943:	PUSH 	0.01		
944:	CALLX	9 :CONSOLETEXT		3
945:	POPN 	4		
946:	JNB  	G24:TEXTURE_ENABLED		Quad:949
947:	MOV  	<cStr30 "Texturing abilitato">		BP(2)
948:	JMP  			Quad:950
949:	MOV  	<cStr31 "Texturing disabilitato">		BP(2)
950:	JNB  	G25:WIREFRAME_ENABLED		Quad:953
951:	ADD  	<cStr32 " - Wireframe abilitato">		BP(2)
952:	JMP  			Quad:954
953:	ADD  	<cStr33 " - Wireframe disabilitato">		BP(2)
954:	PUSH 	BP(2)		
955:	PUSH 	0.95		
956:	PUSH 	0.01		
957:	CALLX	9 :CONSOLETEXT		3
958:	POPN 	4		
959:	JEQ  	G27:ACTIVE_COMPONENT	0	Quad:968
960:	JEQ  	G27:ACTIVE_COMPONENT	1	Quad:982
961:	JEQ  	G27:ACTIVE_COMPONENT	2	Quad:996
962:	JEQ  	G27:ACTIVE_COMPONENT	3	Quad:1010
963:	JEQ  	G27:ACTIVE_COMPONENT	4	Quad:1017
964:	JEQ  	G27:ACTIVE_COMPONENT	5	Quad:1029
965:	JEQ  	G27:ACTIVE_COMPONENT	6	Quad:1041
966:	JEQ  	G27:ACTIVE_COMPONENT	7	Quad:1053
967:	JMP  			Quad:1059
968:	MOV  	<cStr34 "Material - Ambient">		BP(2)
969:	GET  	G16:AMBIENT_COLOR	0	BP(4)
970:	GET  	G16:AMBIENT_COLOR	1	BP(5)
971:	GET  	G16:AMBIENT_COLOR	2	BP(6)
972:	GET  	G16:AMBIENT_COLOR	3	BP(7)
973:	PUSH 	BP(7)		
974:	PUSH 	BP(6)		
975:	PUSH 	BP(5)		
976:	PUSH 	BP(4)		
977:	PUSH 	<cStr35 "R: %f - G: %f - B: %f - A: %f">		
978:	CALLX	40 :SPRINTF		5
979:	POP  			BP(1)
980:	POPN 	5		
981:	JMP  			Quad:1059
982:	MOV  	<cStr36 "Material - Diffuse">		BP(2)
983:	GET  	G17:DIFFUSE_COLOR	0	BP(4)
984:	GET  	G17:DIFFUSE_COLOR	1	BP(5)
985:	GET  	G17:DIFFUSE_COLOR	2	BP(6)
986:	GET  	G17:DIFFUSE_COLOR	3	BP(7)
987:	PUSH 	BP(7)		
988:	PUSH 	BP(6)		
989:	PUSH 	BP(5)		
990:	PUSH 	BP(4)		
991:	PUSH 	<cStr35 "R: %f - G: %f - B: %f - A: %f">		
992:	CALLX	40 :SPRINTF		5
993:	POP  			BP(1)
994:	POPN 	5		
995:	JMP  			Quad:1059
996:	MOV  	<cStr37 "Material - Specular">		BP(2)
997:	GET  	G18:SPECULAR_COLOR	0	BP(4)
998:	GET  	G18:SPECULAR_COLOR	1	BP(5)
999:	GET  	G18:SPECULAR_COLOR	2	BP(6)
1000:	GET  	G18:SPECULAR_COLOR	3	BP(7)
1001:	PUSH 	BP(7)		
1002:	PUSH 	BP(6)		
1003:	PUSH 	BP(5)		
1004:	PUSH 	BP(4)		
1005:	PUSH 	<cStr35 "R: %f - G: %f - B: %f - A: %f">		
1006:	CALLX	40 :SPRINTF		5
1007:	POP  			BP(1)
1008:	POPN 	5		
1009:	JMP  			Quad:1059
1010:	MOV  	<cStr38 "Material - Shininess">		BP(2)
1011:	PUSH 	G19:SHININESS		
1012:	PUSH 	<cStr39 "%f">		
1013:	CALLX	40 :SPRINTF		2
1014:	POP  			BP(1)
1015:	POPN 	2		
1016:	JMP  			Quad:1059
1017:	MOV  	<cStr40 "Light - Ambient">		BP(2)
1018:	GET  	G20:AMBIENT_LIGHT	0	BP(4)
1019:	GET  	G20:AMBIENT_LIGHT	1	BP(5)
1020:	GET  	G20:AMBIENT_LIGHT	2	BP(6)
1021:	PUSH 	BP(6)		
1022:	PUSH 	BP(5)		
1023:	PUSH 	BP(4)		
1024:	PUSH 	<cStr41 "R: %f - G: %f - B: %f">		
1025:	CALLX	40 :SPRINTF		4
1026:	POP  			BP(1)
1027:	POPN 	4		
1028:	JMP  			Quad:1059
1029:	MOV  	<cStr42 "Light - Diffuse">		BP(2)
1030:	GET  	G21:DIFFUSE_LIGHT	0	BP(4)
1031:	GET  	G21:DIFFUSE_LIGHT	1	BP(5)
1032:	GET  	G21:DIFFUSE_LIGHT	2	BP(6)
1033:	PUSH 	BP(6)		
1034:	PUSH 	BP(5)		
1035:	PUSH 	BP(4)		
1036:	PUSH 	<cStr41 "R: %f - G: %f - B: %f">		
1037:	CALLX	40 :SPRINTF		4
1038:	POP  			BP(1)
1039:	POPN 	4		
1040:	JMP  			Quad:1059
1041:	MOV  	<cStr43 "Light - Specular">		BP(2)
1042:	GET  	G22:SPECULAR_LIGHT	0	BP(4)
1043:	GET  	G22:SPECULAR_LIGHT	1	BP(5)
1044:	GET  	G22:SPECULAR_LIGHT	2	BP(6)
1045:	PUSH 	BP(6)		
1046:	PUSH 	BP(5)		
1047:	PUSH 	BP(4)		
1048:	PUSH 	<cStr41 "R: %f - G: %f - B: %f">		
1049:	CALLX	40 :SPRINTF		4
1050:	POP  			BP(1)
1051:	POPN 	4		
1052:	JMP  			Quad:1059
1053:	MOV  	<cStr44 "Quad divisions">		BP(2)
1054:	PUSH 	G26:SEGS		
1055:	PUSH 	<cStr45 "Segs: %f">		
1056:	CALLX	40 :SPRINTF		2
1057:	POP  			BP(1)
1058:	POPN 	2		
1059:	ADD  	<cStr46 "Componente attiva: ">	BP(2)	BP(3)
1060:	PUSH 	BP(3)		
1061:	PUSH 	0.92		
1062:	PUSH 	0.01		
1063:	CALLX	9 :CONSOLETEXT		3
1064:	POPN 	4		
1065:	PUSH 	BP(1)		
1066:	PUSH 	0.895		
1067:	PUSH 	0.01		
1068:	CALLX	9 :CONSOLETEXT		3
1069:	POPN 	4		
1070:	PUSH 	<cStr47 "La luce si muove su una semisfera:">		
1071:	PUSH 	0.98		
1072:	PUSH 	0.65		
1073:	CALLX	9 :CONSOLETEXT		3
1074:	POPN 	4		
1075:	PUSH 	<cStr48 "   Frecce SX,DX:  +/- angolo orizzontale">		
1076:	PUSH 	0.955		
1077:	PUSH 	0.65		
1078:	CALLX	9 :CONSOLETEXT		3
1079:	POPN 	4		
1080:	PUSH 	<cStr49 "   Frecce UP,DWN: +/- angolo verticale">		
1081:	PUSH 	0.93		
1082:	PUSH 	0.65		
1083:	CALLX	9 :CONSOLETEXT		3
1084:	POPN 	4		
1085:	PUSH 	<cStr50 "   Page UP,DWN:   +/- raggio">		
1086:	PUSH 	0.905		
1087:	PUSH 	0.65		
1088:	CALLX	9 :CONSOLETEXT		3
1089:	POPN 	4		
1090:	PUSH 	<cStr51 "Selezione componente attiva:">		
1091:	PUSH 	0.88		
1092:	PUSH 	0.65		
1093:	CALLX	9 :CONSOLETEXT		3
1094:	POPN 	4		
1095:	PUSH 	<cStr52 "   1: Material, ambient">		
1096:	PUSH 	0.855		
1097:	PUSH 	0.65		
1098:	CALLX	9 :CONSOLETEXT		3
1099:	POPN 	4		
1100:	PUSH 	<cStr53 "   2: Material, diffuse">		
1101:	PUSH 	0.83		
1102:	PUSH 	0.65		
1103:	CALLX	9 :CONSOLETEXT		3
1104:	POPN 	4		
1105:	PUSH 	<cStr54 "   3: Material, specular">		
1106:	PUSH 	0.805		
1107:	PUSH 	0.65		
1108:	CALLX	9 :CONSOLETEXT		3
1109:	POPN 	4		
1110:	PUSH 	<cStr55 "   4: Material, shininess">		
1111:	PUSH 	0.78		
1112:	PUSH 	0.65		
1113:	CALLX	9 :CONSOLETEXT		3
1114:	POPN 	4		
1115:	PUSH 	<cStr56 "   5: Light, ambient">		
1116:	PUSH 	0.855		
1117:	PUSH 	0.83		
1118:	CALLX	9 :CONSOLETEXT		3
1119:	POPN 	4		
1120:	PUSH 	<cStr57 "   6: Light, diffuse">		
1121:	PUSH 	0.83		
1122:	PUSH 	0.83		
1123:	CALLX	9 :CONSOLETEXT		3
1124:	POPN 	4		
1125:	PUSH 	<cStr58 "   7: Light, specular">		
1126:	PUSH 	0.805		
1127:	PUSH 	0.83		
1128:	CALLX	9 :CONSOLETEXT		3
1129:	POPN 	4		
1130:	PUSH 	<cStr59 "   8: Quad divisions(segs)">		
1131:	PUSH 	0.78		
1132:	PUSH 	0.83		
1133:	CALLX	9 :CONSOLETEXT		3
1134:	POPN 	4		
1135:	PUSH 	<cStr60 "Modifica valore componenti:">		
1136:	PUSH 	0.755		
1137:	PUSH 	0.65		
1138:	CALLX	9 :CONSOLETEXT		3
1139:	POPN 	4		
1140:	PUSH 	<cStr61 "   Q,A: Red   +/-  (o shininess/segs +/-)">		
1141:	PUSH 	0.73		
1142:	PUSH 	0.65		
1143:	CALLX	9 :CONSOLETEXT		3
1144:	POPN 	4		
1145:	PUSH 	<cStr62 "   W,S: Green +/-">		
1146:	PUSH 	0.705		
1147:	PUSH 	0.65		
1148:	CALLX	9 :CONSOLETEXT		3
1149:	POPN 	4		
1150:	PUSH 	<cStr63 "   E,D: Blue  +/-">		
1151:	PUSH 	0.68		
1152:	PUSH 	0.65		
1153:	CALLX	9 :CONSOLETEXT		3
1154:	POPN 	4		
1155:	PUSH 	<cStr64 "   R,F: Alpha +/-">		
1156:	PUSH 	0.655		
1157:	PUSH 	0.65		
1158:	CALLX	9 :CONSOLETEXT		3
1159:	POPN 	4		
1160:	PUSH 	<cStr65 "Abilita/Disabilita:">		
1161:	PUSH 	0.63		
1162:	PUSH 	0.65		
1163:	CALLX	9 :CONSOLETEXT		3
1164:	POPN 	4		
1165:	PUSH 	<cStr66 "   L: Lighting">		
1166:	PUSH 	0.605		
1167:	PUSH 	0.65		
1168:	CALLX	9 :CONSOLETEXT		3
1169:	POPN 	4		
1170:	PUSH 	<cStr67 "   T: Texture Mapping">		
1171:	PUSH 	0.58		
1172:	PUSH 	0.65		
1173:	CALLX	9 :CONSOLETEXT		3
1174:	POPN 	4		
1175:	PUSH 	<cStr68 "   Z: Wireframe">		
1176:	PUSH 	0.555		
1177:	PUSH 	0.65		
1178:	CALLX	9 :CONSOLETEXT		3
1179:	POPN 	4		
1180:	PUSH 	<cStr69 "   O: Cambia oggetto (sfera/quad)">		
1181:	PUSH 	0.53		
1182:	PUSH 	0.65		
1183:	CALLX	9 :CONSOLETEXT		3
1184:	POPN 	4		
1185:	PUSH 	<cStr70 "      NB: texturing solo per quad">		
1186:	PUSH 	0.505		
1187:	PUSH 	0.65		
1188:	CALLX	9 :CONSOLETEXT		3
1189:	POPN 	4		
1190:	RET  	Void		
1191:	PUSHN	1		
1192:	GET  	G16:AMBIENT_COLOR	0	BP(1)
1193:	JGEQ 	BP(1)	0	Quad:1196
1194:	SET  	0	0	G16:AMBIENT_COLOR
1195:	JMP  			Quad:1199
1196:	GET  	G16:AMBIENT_COLOR	0	BP(1)
1197:	JLEQ 	BP(1)	1	Quad:1199
1198:	SET  	1	0	G16:AMBIENT_COLOR
1199:	GET  	G16:AMBIENT_COLOR	1	BP(1)
1200:	JGEQ 	BP(1)	0	Quad:1203
1201:	SET  	0	1	G16:AMBIENT_COLOR
1202:	JMP  			Quad:1206
1203:	GET  	G16:AMBIENT_COLOR	1	BP(1)
1204:	JLEQ 	BP(1)	1	Quad:1206
1205:	SET  	1	1	G16:AMBIENT_COLOR
1206:	GET  	G16:AMBIENT_COLOR	2	BP(1)
1207:	JGEQ 	BP(1)	0	Quad:1210
1208:	SET  	0	2	G16:AMBIENT_COLOR
1209:	JMP  			Quad:1213
1210:	GET  	G16:AMBIENT_COLOR	2	BP(1)
1211:	JLEQ 	BP(1)	1	Quad:1213
1212:	SET  	1	2	G16:AMBIENT_COLOR
1213:	GET  	G16:AMBIENT_COLOR	3	BP(1)
1214:	JGEQ 	BP(1)	0	Quad:1217
1215:	SET  	0	3	G16:AMBIENT_COLOR
1216:	JMP  			Quad:1220
1217:	GET  	G16:AMBIENT_COLOR	3	BP(1)
1218:	JLEQ 	BP(1)	1	Quad:1220
1219:	SET  	1	3	G16:AMBIENT_COLOR
1220:	GET  	G17:DIFFUSE_COLOR	0	BP(1)
1221:	JGEQ 	BP(1)	0	Quad:1224
1222:	SET  	0	0	G17:DIFFUSE_COLOR
1223:	JMP  			Quad:1227
1224:	GET  	G17:DIFFUSE_COLOR	0	BP(1)
1225:	JLEQ 	BP(1)	1	Quad:1227
1226:	SET  	1	0	G17:DIFFUSE_COLOR
1227:	GET  	G17:DIFFUSE_COLOR	1	BP(1)
1228:	JGEQ 	BP(1)	0	Quad:1231
1229:	SET  	0	1	G17:DIFFUSE_COLOR
1230:	JMP  			Quad:1234
1231:	GET  	G17:DIFFUSE_COLOR	1	BP(1)
1232:	JLEQ 	BP(1)	1	Quad:1234
1233:	SET  	1	1	G17:DIFFUSE_COLOR
1234:	GET  	G17:DIFFUSE_COLOR	2	BP(1)
1235:	JGEQ 	BP(1)	0	Quad:1238
1236:	SET  	0	2	G17:DIFFUSE_COLOR
1237:	JMP  			Quad:1241
1238:	GET  	G17:DIFFUSE_COLOR	2	BP(1)
1239:	JLEQ 	BP(1)	1	Quad:1241
1240:	SET  	1	2	G17:DIFFUSE_COLOR
1241:	GET  	G17:DIFFUSE_COLOR	3	BP(1)
1242:	JGEQ 	BP(1)	0	Quad:1245
1243:	SET  	0	3	G17:DIFFUSE_COLOR
1244:	JMP  			Quad:1248
1245:	GET  	G17:DIFFUSE_COLOR	3	BP(1)
1246:	JLEQ 	BP(1)	1	Quad:1248
1247:	SET  	1	3	G17:DIFFUSE_COLOR
1248:	GET  	G18:SPECULAR_COLOR	0	BP(1)
1249:	JGEQ 	BP(1)	0	Quad:1252
1250:	SET  	0	0	G18:SPECULAR_COLOR
1251:	JMP  			Quad:1255
1252:	GET  	G18:SPECULAR_COLOR	0	BP(1)
1253:	JLEQ 	BP(1)	1	Quad:1255
1254:	SET  	1	0	G18:SPECULAR_COLOR
1255:	GET  	G18:SPECULAR_COLOR	1	BP(1)
1256:	JGEQ 	BP(1)	0	Quad:1259
1257:	SET  	0	1	G18:SPECULAR_COLOR
1258:	JMP  			Quad:1262
1259:	GET  	G18:SPECULAR_COLOR	1	BP(1)
1260:	JLEQ 	BP(1)	1	Quad:1262
1261:	SET  	1	1	G18:SPECULAR_COLOR
1262:	GET  	G18:SPECULAR_COLOR	2	BP(1)
1263:	JGEQ 	BP(1)	0	Quad:1266
1264:	SET  	0	2	G18:SPECULAR_COLOR
1265:	JMP  			Quad:1269
1266:	GET  	G18:SPECULAR_COLOR	2	BP(1)
1267:	JLEQ 	BP(1)	1	Quad:1269
1268:	SET  	1	2	G18:SPECULAR_COLOR
1269:	GET  	G18:SPECULAR_COLOR	3	BP(1)
1270:	JGEQ 	BP(1)	0	Quad:1273
1271:	SET  	0	3	G18:SPECULAR_COLOR
1272:	JMP  			Quad:1276
1273:	GET  	G18:SPECULAR_COLOR	3	BP(1)
1274:	JLEQ 	BP(1)	1	Quad:1276
1275:	SET  	1	3	G18:SPECULAR_COLOR
1276:	GET  	G20:AMBIENT_LIGHT	0	BP(1)
1277:	JGEQ 	BP(1)	0	Quad:1280
1278:	SET  	0	0	G20:AMBIENT_LIGHT
1279:	JMP  			Quad:1283
1280:	GET  	G20:AMBIENT_LIGHT	0	BP(1)
1281:	JLEQ 	BP(1)	1	Quad:1283
1282:	SET  	1	0	G20:AMBIENT_LIGHT
1283:	GET  	G20:AMBIENT_LIGHT	1	BP(1)
1284:	JGEQ 	BP(1)	0	Quad:1287
1285:	SET  	0	1	G20:AMBIENT_LIGHT
1286:	JMP  			Quad:1290
1287:	GET  	G20:AMBIENT_LIGHT	1	BP(1)
1288:	JLEQ 	BP(1)	1	Quad:1290
1289:	SET  	1	1	G20:AMBIENT_LIGHT
1290:	GET  	G20:AMBIENT_LIGHT	2	BP(1)
1291:	JGEQ 	BP(1)	0	Quad:1294
1292:	SET  	0	2	G20:AMBIENT_LIGHT
1293:	JMP  			Quad:1297
1294:	GET  	G20:AMBIENT_LIGHT	2	BP(1)
1295:	JLEQ 	BP(1)	1	Quad:1297
1296:	SET  	1	2	G20:AMBIENT_LIGHT
1297:	GET  	G20:AMBIENT_LIGHT	3	BP(1)
1298:	JGEQ 	BP(1)	0	Quad:1301
1299:	SET  	0	3	G20:AMBIENT_LIGHT
1300:	JMP  			Quad:1304
1301:	GET  	G20:AMBIENT_LIGHT	3	BP(1)
1302:	JLEQ 	BP(1)	1	Quad:1304
1303:	SET  	1	3	G20:AMBIENT_LIGHT
1304:	GET  	G21:DIFFUSE_LIGHT	0	BP(1)
1305:	JGEQ 	BP(1)	0	Quad:1308
1306:	SET  	0	0	G21:DIFFUSE_LIGHT
1307:	JMP  			Quad:1311
1308:	GET  	G21:DIFFUSE_LIGHT	0	BP(1)
1309:	JLEQ 	BP(1)	1	Quad:1311
1310:	SET  	1	0	G21:DIFFUSE_LIGHT
1311:	GET  	G21:DIFFUSE_LIGHT	1	BP(1)
1312:	JGEQ 	BP(1)	0	Quad:1315
1313:	SET  	0	1	G21:DIFFUSE_LIGHT
1314:	JMP  			Quad:1318
1315:	GET  	G21:DIFFUSE_LIGHT	1	BP(1)
1316:	JLEQ 	BP(1)	1	Quad:1318
1317:	SET  	1	1	G21:DIFFUSE_LIGHT
1318:	GET  	G21:DIFFUSE_LIGHT	2	BP(1)
1319:	JGEQ 	BP(1)	0	Quad:1322
1320:	SET  	0	2	G21:DIFFUSE_LIGHT
1321:	JMP  			Quad:1325
1322:	GET  	G21:DIFFUSE_LIGHT	2	BP(1)
1323:	JLEQ 	BP(1)	1	Quad:1325
1324:	SET  	1	2	G21:DIFFUSE_LIGHT
1325:	GET  	G21:DIFFUSE_LIGHT	3	BP(1)
1326:	JGEQ 	BP(1)	0	Quad:1329
1327:	SET  	0	3	G21:DIFFUSE_LIGHT
1328:	JMP  			Quad:1332
1329:	GET  	G21:DIFFUSE_LIGHT	3	BP(1)
1330:	JLEQ 	BP(1)	1	Quad:1332
1331:	SET  	1	3	G21:DIFFUSE_LIGHT
1332:	GET  	G22:SPECULAR_LIGHT	0	BP(1)
1333:	JGEQ 	BP(1)	0	Quad:1336
1334:	SET  	0	0	G22:SPECULAR_LIGHT
1335:	JMP  			Quad:1339
1336:	GET  	G22:SPECULAR_LIGHT	0	BP(1)
1337:	JLEQ 	BP(1)	1	Quad:1339
1338:	SET  	1	0	G22:SPECULAR_LIGHT
1339:	GET  	G22:SPECULAR_LIGHT	1	BP(1)
1340:	JGEQ 	BP(1)	0	Quad:1343
1341:	SET  	0	1	G22:SPECULAR_LIGHT
1342:	JMP  			Quad:1346
1343:	GET  	G22:SPECULAR_LIGHT	1	BP(1)
1344:	JLEQ 	BP(1)	1	Quad:1346
1345:	SET  	1	1	G22:SPECULAR_LIGHT
1346:	GET  	G22:SPECULAR_LIGHT	2	BP(1)
1347:	JGEQ 	BP(1)	0	Quad:1350
1348:	SET  	0	2	G22:SPECULAR_LIGHT
1349:	JMP  			Quad:1353
1350:	GET  	G22:SPECULAR_LIGHT	2	BP(1)
1351:	JLEQ 	BP(1)	1	Quad:1353
1352:	SET  	1	2	G22:SPECULAR_LIGHT
1353:	GET  	G22:SPECULAR_LIGHT	3	BP(1)
1354:	JGEQ 	BP(1)	0	Quad:1357
1355:	SET  	0	3	G22:SPECULAR_LIGHT
1356:	JMP  			Quad:1360
1357:	GET  	G22:SPECULAR_LIGHT	3	BP(1)
1358:	JLEQ 	BP(1)	1	Quad:1360
1359:	SET  	1	3	G22:SPECULAR_LIGHT
1360:	JGEQ 	G19:SHININESS	0	Quad:1363
1361:	MOV  	0		G19:SHININESS
1362:	RET  	Void		
1363:	JLEQ 	G19:SHININESS	128	Quad:1365
1364:	MOV  	128		G19:SHININESS
1365:	RET  	Void		
