<!-- Electromagnetic.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 12月 23 22:17:45 2017 (+0800)
;; Last-Updated: 三 1月 31 23:26:59 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 6
;; URL: http://wuhongyi.cn -->

# Electromagnetic

**这里只介绍中低能实验核物理模拟需要用到的，粒子物理中的部分这里不给出说明**

**A description of the various electromagnetic physics constructors and their effects on the simulation performance both in terms of computation (CPU) and physics precision.**

> http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/PhysicsListGuide/html/index.html

文献：
- 2011
	- [Recent Improvements in Geant4 Electromagnetic Physics Models and Interfaces](http://wuhongyi.cn/Geant4Note/pdf/article/electromagnetic/898-903.pdf)


----


The default electromagnetic physics is built by the G4EmStandardPhysics constructor (see details in EM Opt0).
It is implemented for the following particles: γ, e−, e+, μ−, μ+, τ−, τ+, K+, K−, p, Σ+, Σ−, Ξ−, Ω−, anti(Σ+, Σ−, Ξ−, Ω−), d, t, 3He, α, anti(d, t, 3He, α), and G4GenericIon.

Several charmed mesons are also treated, D+, D−, Ds+, Ds−, Λc+, Σc+, Σc++, Ξc+, anti(Λc+, Σc+, Σc++, Ξc++), as well as two bottom mesons, B+ and B−.

Internal tables for energy loss, range and cross sections are built from 100 eV to 100 TeV. These limits are defined
based on LHC experiments requirements. Upper limits of applicability of various electromagnetic processes are larger
and are process dependent. For example, muon models are valid up to 1 PeV. In order to provide particle transport
for all use-cases, the operational energy range goes down to zero but below 1 keV the accuracy of the default set of
models is degraded substantially.

The GEANT4 toolkit includes many alternative physics models, especially, for electromagnetic physics. There are
several well established configurations recommended for different applications:

```
G4EmStandardPhysics_option1 EM Opt1 - extention name EMV;
G4EmStandardPhysics_option2 EM Opt2 - extention name EMX;
G4EmStandardPhysics_option3 EM Opt3 - extention name EMY;
G4EmStandardPhysics_option4 EM Opt4 - extention name EMZ;
G4EmLivermorePhysics EM Liv - extention name LIV;
G4EmPenelopePhysics EM Pen - extention name PEN;
G4EmStandardPhysics_GS EM GS - extention name _GS;
G4EmStandardPhysics_SS EM SS
```

## EM Opt0

This physics list uses “standard” GEANT4 electromagnetic physics as built by the G4EmStandardPhysics constructor. It is implemented for the following particles: *γ, e−, e+, p, d, t, 3He, α, anti(d,t,3He,α), and G4GenericIon*.


Processes cover physics from 0 to 100 TeV for gamma, e − and e + and up to 1 PeV for muons. EM interactions of
charged hadrons and ions cover the range 0 to 100 TeV. Though the operational energy range goes down to zero, below
1 keV accuracy of these models is substantially lower.
For each particle type Standard EM models implement several processes.
Photons: e − /e + pair production is implemented by the BetheHeitler model with the LPM effect at high energies and
Compton scattering is implemented by the Klein-Nishina model. Photo-electric effect and Rayleigh scattering are both
handled by the Livermore models.
Electrons and positrons: multiple Coulomb scattering is handled by the Urban model from 0 to 100 MeV and by the
WentzelVI model from 100 MeV to 100 TeV, which is combined with the single Coulomb scattering model, which is
applied for large angle scattering. Bremsstrahlung is implemented by the eBremSB model and the eBremLPM model
which takes into account the LPM effect at high energies. Ionization is modeled by the Moller-Bhabha formulation,
and positron annihilation is implemented by the eplus2gg model.

Muons: multiple Coulomb scattering is handled by the WentzelVI model combined with the single scattering model
at all energies, and by the eCoulombScattering model at all energies. Bremsstrahlung is handled by the MuBrem
model. Ionization is implemented by several models depending on energy and particle type. From 0 to 200 keV, the
Bragg model is used for mu+ and the ICRU73Q0 parameterization is used for mu-. Between 200 keV and 1 GeV the
BetheBloch model is used for both mu+ and mu-, and from 1 GeV to 100 TeV, the MuBetheBloch model is used for
both mu+ and mu-. The muPairProduction model handles e+/e- pair production caused by either mu+ or mu-.
Pions, kaons, protons and anti-protons: multiple Coulomb scattering is performed by the WentzelVI model and
Coulomb scattering by the eCoulombScattering model. Bremsstrahlung is handled by hBrem model. e − /e + pair
production by hadrons is implemented by the hPairProduction model. Ionization is handled by several models de-
pending on energy and particle type. For pions below 298 keV, Bragg model ionization is used for π + , and the
ICRU73Q0 parameterization is used for π − . Above this energy BetheBloch ionization is used. For kaons, the same
ionization models are used, but the change from low energy to high energy models occurs at 1.05 MeV. For protons,
the Bragg model is used below 2 MeV and the BetheBloch above. For anti-protons ICRU73Q0 is used below 2 MeV
and BetheBloch above.
alpha and G4GenericIon: only two EM processes are applied. Multiple Coulomb scattering in implemented by the
Urban model at all energies. For alphas Bragg ionization is performed below 7.9 MeV and BetheBloch ionization
above. For generic ions, Bragg is used below 2 MeV and BetheBloch above.




<!-- Electromagnetic.md ends here -->
