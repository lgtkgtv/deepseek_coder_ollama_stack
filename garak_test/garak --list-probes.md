# Garak LLM Vulnerability Scanner Probes

**Garak LLM Vulnerability Scanner Probes**

* **ansiescape:** Tests for vulnerabilities related to ANSI escape sequences.
    * ansiescape.AnsiEscaped
    * ansiescape.AnsiRaw
* **atkgen:** Generates adversarial attacks.
    * atkgen.Tox
* **av\_spam\_scanning:** Scans for anti-virus and spam vulnerabilities.
    * av\_spam\_scanning.EICAR
    * av\_spam\_scanning.GTUBE
    * av\_spam\_scanning.GTphish
* **continuation:** Tests for vulnerabilities related to prompt continuation.
    * continuation.ContinueSlursReclaimedSlurs
    * continuation.ContinueSlursReclaimedSlursMini
* **dan:** Tests for vulnerabilities related to DAN (Do Anything Now) jailbreaks.
    * dan.Ablation_Dan_11_0
    * dan.AntiDAN
    * dan.AutoDAN
    * dan.AutoDANCached
    * dan.ChatGPT_Developer_Mode_RANTI
    * dan.ChatGPT_Developer_Mode_v2
    * dan.ChatGPT_Image_Markdown
    * dan.DAN_Jailbreak
    * dan.DUDE
    * dan.DanInTheWild
    * dan.DanInTheWildMini
    * dan.Dan_10_0
    * dan.Dan_11_0
    * dan.Dan_6_0
    * dan.Dan_6_2
    * dan.Dan_7_0
    * dan.Dan_8_0
    * dan.Dan_9_0
    * dan.STAN
* **divergence:** Tests for divergence in model responses.
    * divergence.Repeat
    * divergence.RepeatExtended
* **donotanswer:** Tests for cases where the model should refuse to answer.
    * donotanswer.DiscriminationExclusionToxicityHatefulOffensive
    * donotanswer.HumanChatbox
    * donotanswer.InformationHazard
    * donotanswer.MaliciousUses
    * donotanswer.MisinformationHarms
* **encoding:** Tests for vulnerabilities related to different encoding methods.
    * encoding.InjectAscii85
    * encoding.InjectBase16
    * encoding.InjectBase2048
    * encoding.InjectBase32
    * encoding.InjectBase64
    * encoding.InjectBraille
    * encoding.InjectEcoji
    * encoding.InjectHex
    * encoding.InjectMime
    * encoding.InjectMorse
    * encoding.InjectNato
    * encoding.InjectQP
    * encoding.InjectROT13
    * encoding.InjectUU
    * encoding.InjectZalgo
* **fileformats:** Tests vulnerabilities related to file format handling.
    * fileformats.HF_Files
* **glitch:** Tests for vulnerabilities related to glitching or corrupting inputs.
    * glitch.Glitch
    * glitch.Glitch100
* **goodside:** Tests for positive or ethical responses.
    * goodside.Davidjl
    * goodside.Tag
    * goodside.ThreatenJSON
    * goodside.WhoIsRiley
* **grandma:** Tests for bypassing restrictions using a "grandma" persona.
    * grandma.Slurs
    * grandma.Substances
    * grandma.Win10
    * grandma.Win11
* **latentinjection:** Tests for latent injection vulnerabilities.
    * latentinjection.LatentInjectionFactSnippetEiffel
    * latentinjection.LatentInjectionFactSnippetLegal
    * latentinjection.LatentInjectionReport
    * latentinjection.LatentInjectionResume
    * latentinjection.LatentInjectionTranslationEnFr
    * latentinjection.LatentInjectionTranslationEnZh
    * latentinjection.LatentJailbreak
    * latentinjection.LatentJailbreakMini
    * latentinjection.LatentWhois
    * latentinjection.LatentWhoisSnippet
* **leakreplay:** Tests for data leakage and replay attacks.
    * leakreplay.GuardianCloze
    * leakreplay.GuardianComplete
    * leakreplay.LiteratureCloze
    * leakreplay.LiteratureCloze80
    * leakreplay.LiteratureComplete
    * leakreplay.LiteratureComplete80
    * leakreplay.NYTCloze
    * leakreplay.NYTComplete
    * leakreplay.PotterCloze
    * leakreplay.PotterComplete
* **lmrc:** Tests for language model risk categories.
    * lmrc.Anthropomorphisation
    * lmrc.Bullying
    * lmrc.Deadnaming
    * lmrc.Profanity
    * lmrc.QuackMedicine
    * lmrc.SexualContent
    * lmrc.Sexualisation
    * lmrc.SlurUsage
* **malwaregen:** Tests for the model's ability to generate malware-related code.
    * malwaregen.Evasion
    * malwaregen.Payload
    * malwaregen.SubFunctions
    * malwaregen.TopLevel
* **misleading:** Tests for the model's propensity to generate misleading information.
    * misleading.FalseAssertion50
* **packagehallucination:** Tests for package hallucination vulnerabilities.
    * packagehallucination.JavaScript
    * packagehallucination.PackageHallucinationProbe
    * packagehallucination.Python
    * packagehallucination.Ruby
    * packagehallucination.Rust
* **phrasing:** Tests for vulnerabilities related to phrasing and tense.
    * phrasing.FutureTense
    * phrasing.FutureTenseMini
    * phrasing.PastTense
    * phrasing.PastTenseMini
* **promptinject:** Tests for prompt injection vulnerabilities.
    * promptinject.HijackHateHumans
    * promptinject.HijackHateHumansMini
    * promptinject.HijackKillHumans
    * promptinject.HijackKillHumansMini
    * promptinject.HijackLongPrompt
    * promptinject.HijackLongPromptMini
* **realtoxicityprompts:** Tests for the model's tendency to generate toxic responses.
    * realtoxicityprompts.RTPBlank
    * realtoxicityprompts.RTPFlirtation
    * realtoxicityprompts.RTPIdentity_Attack
    * realtoxicityprompts.RTPInsult
    * realtoxicityprompts.RTPProfanity
    * realtoxicityprompts.RTPSevere_Toxicity
    * realtoxicityprompts.RTPSexually_Explicit
    * realtoxicityprompts.RTPThreat
* **snowball:** Tests for snowballing or iterative vulnerabilities.
    * snowball.GraphConnectivity
    * snowball.GraphConnectivityMini
    * snowball.Primes
    * snowball.PrimesMini
    * snowball.Senators
    * snowball.SenatorsMini
* **suffix:** Tests for vulnerabilities related to suffixes.
    * suffix.BEAST
    * suffix.GCG
    * suffix.GCGCached
* **tap:** Tests for TAP vulnerabilities.
    * tap.PAIR
    * tap.TAP
    * tap.TAPCached
* **test:** General test probes.
    * test.Blank
    * test.Test
* **topic:** Tests for vulnerabilities related to specific topics.
    * topic.WordnetAllowedWords
    * topic.WordnetBlockedWords
    * topic.WordnetControversial
* **visual\_jailbreak:** Tests for visual jailbreak vulnerabilities.
    * visual\_jailbreak.FigStep
    * visual\_jailbreak.FigStepTiny
* **xss:** Tests for cross-site scripting (XSS) vulnerabilities.
    * xss.ColabAIDataLeakage
    * xss.MarkdownImageExfil
    * xss.MdExfil20230929
    * xss.StringAssemblyDataExfil

```markdown
| Probe Name               | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
