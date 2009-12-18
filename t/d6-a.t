#!/usr/bin/perl -w
use strict;
use warnings;

BEGIN {
    $ENV{PV_TEST_PERL}  = 1;
}
use Test::Simple tests => 514;
use Math::StochasticProcess;
use Math::StochasticProcess::Event;
use Math::StochasticProcess::Event::Tuple qw(RESOLVED_VAR_NAME);
use Math::StochasticProcess::RandomVariable;
use lib qw(t/lib);
use LogDir;
my $logdir = LogDir->new;

# experiment: Roll a d6 repeatedly until you have reached the goal.
# What is the expected number of rounds before reaching the goal
# and what is the distribution?
goal(1, {1=>1});
goal(2, {1=>5/6,2=>1/6});
goal(3, {1=>24/36,2=>11/36,3=>1/36});
goal(4, {1=>108/6**3,2=>90/6**3,3=>17/6**3,4=>1/6**3});
goal(5, {1=>432/6**4,2=>648/6**4,3=>192/6**4,4=>23/6**4,5=>1/6**4});
goal(6, {1=>1296/6**5,2=>4320/6**5,3=>1800/6**5,4=>330/6**5,5=>29/6**5,6=>1/6**5});
goal(7, {2=>27216/6**6,3=>15120/6**6,4=>3780/6**6,5=>504/6**6,6=>35/6**6,7=>1/6**6});
# The following data were generated by the module itself so
# only count as a regression test.
goal(50,
 {10=>0.00281903059323613,
11=>0.022559769614007,
12=>0.0781762370934638,
13=>0.156357836382835,
14=>0.209155345700122,
15=>0.204316469475583,
16=>0.154378422543537,
17=>0.0939029198094551,
18=>0.0473366916666781,
19=>0.0202123461994763,
20=>0.00743405318791158,
21=>0.00238637362708632,
22=>0.000675605668795575,
23=>0.000170108733463641,
24=>3.83499675289904e-005,
25=>7.78328113661489e-006,
26=>1.42824175157994e-006,
27=>2.377743892587e-007,
28=>3.60073226926565e-008,
29=>4.96948370584124e-009,
30=>6.25864852940614e-010,
31=>7.19768483896211e-011,
32=>7.5594529441076e-012,
33=>7.2467721494087e-013,
34=>6.32988230736224e-014,
35=>4.94051597069063e-015,
36=>2.50515574705256e-016,
9=>7.09487565411777e-005});
goal(100, {17=>1.01024068309698e-011,
18=>1.53390081199638e-008,
19=>1.25920782850994e-006,
20=>2.89750327445261e-005,
21=>0.000306239125733899,
22=>0.00187370973371302,
23=>0.00757157360021044,
24=>0.021978594391572,
25=>0.0485499120411641,
26=>0.0850876924913648,
27=>0.122084311180418,
28=>0.146936939576292,
29=>0.151241085289964,
30=>0.135229677495472,
31=>0.106397872704039,
32=>0.0744600059048976,
33=>0.0467720751446889,
34=>0.0265759058723744,
35=>0.0137506121992571,
36=>0.00651624877821861,
37=>0.00284252351410833,
38=>0.00114646803170606,
39=>0.000429204924617336,
40=>0.000149662005218888,
41=>4.87567381347807e-005,
42=>1.48806210928682e-005,
43=>4.26512001117039e-006,
44=>1.1505733190854e-006,
45=>2.9269861461023e-007,
46=>7.03417303408569e-008,
47=>1.59946770605423e-008,
48=>3.44604627451277e-009,
49=>7.0436669460346e-010,
50=>1.3674099367006e-010,
51=>2.5238073062568e-011,
52=>4.43250878173169e-012,
53=>7.4124295418668e-013,
54=>1.18003918430757e-013,
55=>1.77829903411796e-014,
56=>2.41134543347828e-015,
57=>1.84578304593062e-016});
goal(1000, {228=>2.27595025233045e-016,
229=>2.27714724824767e-015,
230=>9.34609540872403e-015,
231=>3.22558120280281e-014,
232=>1.04356649751224e-013,
233=>3.24098211001864e-013,
234=>9.72871830042409e-013,
235=>2.82967788115963e-012,
236=>7.9842518654316e-012,
237=>2.18714852996218e-011,
238=>5.82017581823108e-011,
239=>1.50538821271499e-010,
240=>3.78654073430532e-010,
241=>9.26693859239327e-010,
242=>2.20769785415384e-009,
243=>5.12219347122183e-009,
244=>1.15792968495198e-008,
245=>2.55157919866384e-008,
246=>5.48304183406397e-008,
247=>1.14947397603036e-007,
248=>2.35188416118965e-007,
249=>4.69830213966475e-007,
250=>9.16723437301156e-007,
251=>1.74770274157992e-006,
252=>3.2567438651952e-006,
253=>5.93385714400749e-006,
254=>1.0574857095923e-005,
255=>1.84390424850938e-005,
256=>3.14678679896957e-005,
257=>5.25770646512876e-005,
258=>8.60313666712318e-005,
259=>0.000137903967004114,
260=>0.000216611160437291,
261=>0.000333495923209765,
262=>0.000503412842448747,
263=>0.00074524244613299,
264=>0.00108223859755126,
265=>0.00154209260289779,
266=>0.00215658747923917,
267=>0.00296072119728658,
268=>0.00399120362327766,
269=>0.00528428121624157,
270=>0.00687291578255742,
271=>0.00878343389509187,
272=>0.0110318624520408,
273=>0.0136202597518556,
274=>0.0165334244455187,
275=>0.0197364009051456,
276=>0.0231731860691822,
277=>0.0267669728120993,
278=>0.0304221396743446,
279=>0.0340280268887398,
280=>0.0374643430661945,
281=>0.040607850798972,
282=>0.043339810322653,
283=>0.0455535436534501,
284=>0.0471614361909861,
285=>0.0481007276364519,
286=>0.0483375565379481,
287=>0.0478688987533889,
288=>0.0467222563842962,
289=>0.0449531816973048,
290=>0.0426409308781834,
291=>0.0398827096037467,
292=>0.0367870782646232,
293=>0.0334671207630403,
294=>0.0300339487830928,
295=>0.0265910238288631,
296=>0.0232296491157763,
297=>0.0200258327828442,
298=>0.0170385730201028,
299=>0.0143094818673069,
300=>0.0118635601108806,
301=>0.00971086762534709,
302=>0.00784880276537209,
303=>0.00626470735867699,
304=>0.00493854348421508,
305=>0.003845435814055,
306=>0.00295792989144392,
307=>0.00224787432434627,
308=>0.00168788726723241,
309=>0.00125241063491804,
310=>0.000918387227663574,
311=>0.000665616131442765,
312=>0.000476851516450386,
313=>0.000337711247714995,
314=>0.000236456860925924,
315=>0.000163697740079358,
316=>0.000112061772632983,
317=>7.58639333786294e-005,
318=>5.07942649029676e-005,
319=>3.36382373791911e-005,
320=>2.20357673334003e-005,
321=>1.4280259424603e-005,
322=>9.15573017001593e-006,
323=>5.80810250169637e-006,
324=>3.64581674107334e-006,
325=>2.26469127170518e-006,
326=>1.3922287210437e-006,
327=>8.47096455447048e-007,
328=>5.10162586903652e-007,
329=>3.04137581362229e-007,
330=>1.79493652573559e-007,
331=>1.04876198074493e-007,
332=>6.06714599383838e-008,
333=>3.47537765724405e-008,
334=>1.97133095073204e-008,
335=>1.1073541520971e-008,
336=>6.16044450113713e-009,
337=>3.39441311797874e-009,
338=>1.85256170533381e-009,
339=>1.00152958972448e-009,
340=>5.36371084483549e-010,
341=>2.84579955004184e-010,
342=>1.49591544571605e-010,
343=>7.7911110439709e-011,
344=>4.02074329375908e-011,
345=>2.05613490046954e-011,
346=>1.04197326439725e-011,
347=>5.23284942157681e-012,
348=>2.60438138689677e-012,
349=>1.28453151545419e-012,
350=>6.27780120154655e-013,
351=>3.03916099634677e-013,
352=>1.45629629648555e-013,
353=>6.89491682031879e-014,
354=>3.21253208692291e-014,
355=>1.45924496997976e-014,
356=>6.3142983852996e-015,
357=>2.42164345936114e-015,
358=>6.16850592369043e-016
});

sub goal
{
    my $goal = shift;
    my $dist = shift;
    my $expected = 0.0;
    my $sum = 0.0;
    foreach my $d (keys %$dist) {
        $expected += $d*$dist->{$d};
        $sum += $dist->{$d};
    }
    die "don't even bother" unless abs($sum - 1) < 0.00000001;

    my $seed_event = Math::StochasticProcess::Event::Tuple->new
    (
        random_variables=>
        {
            value=>Math::StochasticProcess::RandomVariable->new(value=>0,internal=>1),
            rounds=>Math::StochasticProcess::RandomVariable->new(value=>0,internal=>0)
        },
        iterate_cb=>sub
        {
            my $self = shift;
            my @results;
            my $rounds = $self->randomVariable('rounds');
            my $value = $self->randomVariable('value');
            my $t = $value +7 - $goal;
            my $l = $t < 0 ? 6 : 6-$t;
            if ($t > 0) {
                push @results, $self->copy($t/6, RESOLVED_VAR_NAME()=>1, rounds=>$rounds+1);
            }
            for(my $i = 1; $i <= $l; $i++) {
                push @results, $self->copy(1/6, rounds=>$rounds+1, value=>$value+$i);
            }
            return @results;
        }
    );
    ok( $seed_event, 'created seed event' );
    ok( $seed_event->isa('Math::StochasticProcess::Event'), 'passes isa test' );

    my $logfh = $logdir->spawn_file("test${goal}-a.log");
    my $analysis = Math::StochasticProcess->new(seed_event=>$seed_event, tolerance=>0.0000000000000001, hard_sanity_level=>0.0000001,log_file_handle=>$logfh);
    ok( $analysis, 'created analysis object' );

    $analysis->run();
    ok(1, 'analysis ran to completion');
    ok(abs($analysis->expectedValue('rounds') - $expected) < 0.00000000001, 'random variable');
    my %event = $analysis->event();
    ok(scalar(keys %event) == scalar(keys %$dist), 'number of events');

    foreach my $d (sort keys %$dist) {
        ok($event{"$d|T"}->randomVariable('rounds') == $d, "rounds: $d; goal: $goal");
        ok(abs($event{"$d|T"}->probability() - $dist->{$d}) < 0.00000000001, "prob: $d; goal: $goal");
    }
}

exit(0);
