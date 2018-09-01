<!-- G4CascadeParameters.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 10:10:26 2018 (+0800)
;; Last-Updated: 六 9月  1 10:26:50 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 4
;; URL: http://wuhongyi.cn -->

# G4CascadeParameters

**静态类**

Encapsulate all user-configurable parameters with associated envvars

```
G4CASCADE_VERBOSE(getenv("G4CASCADE_VERBOSE")),"Enable information messages"
G4CASCADE_CHECK_ECONS(getenv("G4CASCADE_CHECK_ECONS")),"Enable internal conservation checking"
G4CASCADE_USE_PRECOMPOUND(getenv("G4CASCADE_USE_PRECOMPOUND")),"Use PreCompoundModel for nuclear de-excitation"
G4CASCADE_DO_COALESCENCE(getenv("G4CASCADE_DO_COALESCENCE")),"Apply final-state nucleon clustering"
G4CASCADE_SHOW_HISTORY(getenv("G4CASCADE_SHOW_HISTORY")),"Collect and report full structure of cascade"
G4CASCADE_USE_3BODYMOM(getenv("G4CASCADE_USE_3BODYMOM")),"Use three-body momentum parametrizations"
G4CASCADE_USE_PHASESPACE(getenv("G4CASCADE_USE_PHASESPACE")),"Use Kopylov N-body momentum generator"
G4CASCADE_PIN_ABSORPTION(getenv("G4CASCADE_PIN_ABSORPTION")),"Probability for pion absorption on single nucleon"
G4CASCADE_RANDOM_FILE(getenv("G4CASCADE_RANDOM_FILE")),"Save random-engine to file at each interaction"
G4NUCMODEL_USE_BEST(getenv("G4NUCMODEL_USE_BEST")),"Use all physical-units for nuclear structure"
G4NUCMODEL_RAD_2PAR(getenv("G4NUCMODEL_RAD_2PAR")),"Use R = C1*cbrt(A) + C2/cbrt(A)"
G4NUCMODEL_RAD_SCALE(getenv("G4NUCMODEL_RAD_SCALE")),"Set length scale for nuclear model"
G4NUCMODEL_RAD_SMALL(getenv("G4NUCMODEL_RAD_SMALL")),"Set radius of A<4 nuclei"
G4NUCMODEL_RAD_ALPHA(getenv("G4NUCMODEL_RAD_ALPHA")),"Fraction of small-radius for He-4"
G4NUCMODEL_RAD_TRAILING(getenv("G4NUCMODEL_RAD_TRAILING")),"Effective nucleon radius for trailing effect"
G4NUCMODEL_FERMI_SCALE(getenv("G4NUCMODEL_FERMI_SCALE")),"Scale factor for fermi momentum"
G4NUCMODEL_XSEC_SCALE(getenv("G4NUCMODEL_XSEC_SCALE")),"Scale fator for total cross-sections"
G4NUCMODEL_GAMMAQD(getenv("G4NUCMODEL_GAMMAQD")),"Scale factor for gamma-quasideutron cross-sections"
DPMAX_2CLUSTER(getenv("DPMAX_2CLUSTER")),"Maximum momentum for p-n clusters"
DPMAX_3CLUSTER(getenv("DPMAX_3CLUSTER")),"Maximum momentum for ppn/pnn clusters"
DPMAX_4CLUSTER(getenv("DPMAX_4CLUSTER")),"Maximum momentum for alpha clusters"
```

## class

```cpp
public:
  static const G4CascadeParameters* Instance();		// Singleton
  ~G4CascadeParameters();

  // Top-level configuration flags
  static G4int verbose()              { return Instance()->VERBOSE_LEVEL; }
  static G4bool checkConservation()   { return Instance()->CHECK_ECONS; }
  static G4bool usePreCompound()      { return Instance()->USE_PRECOMPOUND; }
  static G4bool doCoalescence()       { return Instance()->DO_COALESCENCE; }
  static G4bool showHistory()         { return Instance()->SHOW_HISTORY; }
  static G4bool use3BodyMom()	      { return Instance()->USE_3BODYMOM; }
  static G4bool usePhaseSpace()       { return Instance()->USE_PHASESPACE; }
  static G4double piNAbsorption()     { return Instance()->PIN_ABSORPTION; }
  static const G4String& randomFile() { return Instance()->RANDOM_FILE; }

  // Nuclear structure parameters
  static G4bool useTwoParam()      { return Instance()->TWOPARAM_RADIUS; }
  static G4double radiusScale()    { return Instance()->RADIUS_SCALE; }	
  static G4double radiusSmall()    { return Instance()->RADIUS_SMALL; }
  static G4double radiusAlpha()    { return Instance()->RADIUS_ALPHA; }
  static G4double radiusTrailing() { return Instance()->RADIUS_TRAILING; }
  static G4double fermiScale()     { return Instance()->FERMI_SCALE; }
  static G4double xsecScale()      { return Instance()->XSEC_SCALE; }
  static G4double gammaQDScale()   { return Instance()->GAMMAQD_SCALE; }

  // Final-state clustering cuts
  static G4double dpMaxDoublet() { return Instance()->DPMAX_DOUBLET; }
  static G4double dpMaxTriplet() { return Instance()->DPMAX_TRIPLET; }
  static G4double dpMaxAlpha()   { return Instance()->DPMAX_ALPHA; }

  static void DumpConfiguration(std::ostream& os) { Instance()->DumpConfig(os); }

private:	// Environment variable values, null pointers mean not set
  const char* G4CASCADE_VERBOSE;
  const char* G4CASCADE_CHECK_ECONS;
  const char* G4CASCADE_USE_PRECOMPOUND;
  const char* G4CASCADE_DO_COALESCENCE;
  const char* G4CASCADE_SHOW_HISTORY;
  const char* G4CASCADE_USE_3BODYMOM;
  const char* G4CASCADE_USE_PHASESPACE;
  const char* G4CASCADE_PIN_ABSORPTION;
  const char* G4CASCADE_RANDOM_FILE;
  const char* G4NUCMODEL_USE_BEST;
  const char* G4NUCMODEL_RAD_2PAR;
  const char* G4NUCMODEL_RAD_SCALE;
  const char* G4NUCMODEL_RAD_SMALL;
  const char* G4NUCMODEL_RAD_ALPHA;
  const char* G4NUCMODEL_RAD_TRAILING;
  const char* G4NUCMODEL_FERMI_SCALE;
  const char* G4NUCMODEL_XSEC_SCALE;
  const char* G4NUCMODEL_GAMMAQD;
  const char* DPMAX_2CLUSTER;
  const char* DPMAX_3CLUSTER;
  const char* DPMAX_4CLUSTER;

  void Initialize();		// Fill parameter values from envvar strings

  G4int VERBOSE_LEVEL;		// Top-level configuration flags
  G4bool CHECK_ECONS;
  G4bool USE_PRECOMPOUND;
  G4bool DO_COALESCENCE;
  G4bool SHOW_HISTORY;
  G4bool USE_3BODYMOM;
  G4bool USE_PHASESPACE;
  G4double PIN_ABSORPTION;
  G4String RANDOM_FILE;

  G4bool BEST_PAR;		// Nuclear structure parameters
//BEST_PAR has been used in a project on hold.
//Currently setting BEST_PAR or G4NUCMODEL_USE_BEST does not improve physics performance.
//Developer can get more information about this from cascade/test/README

  G4bool TWOPARAM_RADIUS;
  G4double RADIUS_SCALE;	
  G4double RADIUS_SMALL;
  G4double RADIUS_ALPHA;
  G4double RADIUS_TRAILING;
  G4double FERMI_SCALE;
  G4double XSEC_SCALE;
  G4double GAMMAQD_SCALE;

  G4double DPMAX_DOUBLET;	// Final-state clustering cuts
  G4double DPMAX_TRIPLET;
  G4double DPMAX_ALPHA;

private:	// Singleton -- no public constructor
  G4CascadeParameters();
  void DumpConfig(std::ostream& os) const;

  G4CascadeParamMessenger* messenger;		// For access via UI commands
  friend class G4CascadeParamMessenger;

  static G4CascadeParameters* fpInstance;
```

<!-- G4CascadeParameters.md ends here -->
