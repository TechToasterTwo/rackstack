include <../helper/math.scad>
include <../helper/sphericalFilet.scad>
include <../helper/cylindricalFilet.scad>
include <../helper/screws.scad>
include <../helper/magnet.scad>
include <./config.scad>
include <./mainRail.scad>

// Connectors
include <./stackConnector.scad>
include <./xyBarConnector.scad>
include <./yBarBasePlateConnector.scad>
include <./side/yBarSideWallConnector.scad>
include <./sharedVariables.scad>

*yBar();

module yBar() {

  applyBasePlateConnector()
  applyStackConnector()
  applySideWallConnector()
  applyRailConnector()
  applyXBarConnector()
  yBarBase();

  module yBarBase() {
    intersection() {
      difference() {
        sphericalFiletEdge(yBarWidth, yBarDepth, yBarHeight, yBarRoundness);

        translate(v = [yBarWallThickness, joinCornerDepth, yBarWallThickness])
        cylindricalFiletEdge(yBarWidth, yBarDepth-2*joinCornerDepth, yBarHeight, yBarRoundness);
      }

      halfspace(vpos=[-1, 0, 1], p=[yBarWidth-1, 0,0]);
    }
  }

  module applyBasePlateConnector() {
    apply_pn() {
      mirrorOtherCorner() {
        translate(v = [yBarWidth-yBarBasePlateConnectorWidth, joinCornerDepth, yBarWallThickness])
        yBarBasePlateMount_P();
      }

      mirrorOtherCorner() {
        translate(v = [yBarWidth-yBarBasePlateConnectorWidth, joinCornerDepth, 0])
        yBarBasePlateMount_N();
      }

      children(0);
    }
  }

  module applyStackConnector() {
    apply_n() {
      mirrorOtherCorner()
      translate(v = [connectorXEdgeToYBarXEdge, connectorYEdgeToYBarYEdge, 0])
      stackConnectorSocket_N();

      children(0);
    }
  }

  module applySideWallConnector() {
    apply_n() {
      mirrorOtherCorner()
      translate(v = [
          yBarWidth-(railTotalWidth+railSlotToInnerYEdge+railSlotToSideWallSlot+sideWallConnectorSlotWidth),
          sideWallSlotToXZ,
          yBarHeight
        ])
      yBarSideWallConnector_N();

      children(0);
    }
  }

  module applyRailConnector() {

    apply_n() {
      mirrorOtherCorner()
      translate(v = [yBarWidth-(railTotalWidth+railSlotToInnerYEdge), railSlotToXZ, yBarHeight-railFootThickness])
      railFeetSlot_N();

      children(0);
    }
  }

  module applyXBarConnector() {
    apply_pn() {

      mirrorOtherCorner()
      translate(v=[yBarWidth + 0.5,14,0])
      xBarConnectorFromY_P();

      mirrorOtherCorner()
      translate(v = [yBarWidth+eps, 0, 0])
      xBarConnectorFromY_N();

      children(0);
    }
  }

  module mirrorOtherCorner() {
    children(0);

    translate(v = [0, yBarDepth, 0])
    mirror(v = [0, 1, 0])
    children(0);
  }

}
