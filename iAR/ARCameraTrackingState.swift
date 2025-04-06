//
//  Created by Om Singh
//  GitHub: https://github.com/OmSingh2003
//
//  This file is part of the iAR project.
//  © 2025 Om Singh. All rights reserved.

import Foundation
import ARKit

extension ARCamera.TrackingState {
	var presentationString: String {
		switch self {
        case .notAvailable:
            return "TRACKING UNAVAILABLE"
        case .normal:
            return "TRACKING NORMAL"
        case .limited(let reason):
            switch reason {
            case .excessiveMotion:
                return "TRACKING LIMITED\nToo much camera movement"
            case .insufficientFeatures:
                return "TRACKING LIMITED\nNot enough surface detail"
            case .initializing:
                return "INITIALIZING"
            case .relocalizing:
                return "INITIALIZING"
            }
        }
	}
}
