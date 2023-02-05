
include <../config.scad>
include <./sideWallVariables.scad>
include <../sharedVariables.scad>
include <../../helper/halfspace.scad>
include <../../misc/magnet.scad>

module magnetModule() {

  applyYBarScrewMount()
  applyMagnetMount()
  base();

  module base() {
    intersection() {
      cube(size = [sideWallConnW, sideWallConnD, sideWallConnLugDepression]);

      // TODO: pattern for this? beef up mirror4XY?
      cVal = 0.5;
      halfspace(p=[0,cVal,0], vpos=[0,1,1]);
      halfspace(p=[cVal,0,0], vpos=[1,0,1]);
      halfspace(p=[sideWallConnW-cVal,0,0], vpos=[-1,0,1]);
      halfspace(p=[0,sideWallConnD-cVal,0], vpos=[0,-1,1]);
    }
  }

  module applyYBarScrewMount() {
    apply_n() {
      translate(v = [yBarScrewHoleToOuterYEdge, yBarScrewHoleToFrontXEdge, sideWallConnLugDepression])
      counterSunkHead_N(rackFrameScrewType, headExtension = eps, screwExtension = inf10);

      children(0);
    }
  }

  module applyMagnetMount() {

    magnetMountDx = magnetMountShellRadius;
    magnetMountDy = magnetMountToYBarFront - sideWallSlotToXZ;
    magnetMountDz = magnetMountToYBarTop + sideWallConnLugDepression;

    apply_pn() {
      magnetMountShell();
      magnetMountHole();
      children(0);
    }

    module magnetMountShell() {
      hull() {
        translate(v = [0, magnetMountDy, magnetMountDz])
        rotate(a = [0, 90, 0])
        cylinder(r = magnetMountShellRadius, h = sideWallConnW-magnetFaceToSideWallConnOuterYEdge);

        translate(v = [0, 2, sideWallConnH])
        cube(size = [sideWallConnW-magnetFaceToSideWallConnOuterYEdge, 2*magnetMountShellRadius, eps]);
      }
    }

    module magnetMountHole() {
      translate(v = [sideWallConnW-(magnetFaceToSideWallConnOuterYEdge+magnetHSlacked),
        magnetMountDy,
        magnetMountDz])
      rotate(a = [0, 90, 0])
      cylinder(r = magnetRSlacked, h = magnetHSlacked);
    }
  }


}