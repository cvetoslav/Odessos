extends Node2D

var isCameraLocked = true
var cameraSpeed = 3.5

var mapScale = 12.91 # m/px

var windGrid = [[Vector2(4.698463, 1.710101), Vector2(0.522642, 4.972609), Vector2(0.522642, 4.972609), Vector2(0.782172, 4.938442), Vector2(1.039558, 4.890738), Vector2(0.609347, 4.96273), Vector2(1.20961, 4.851479), Vector2(0.609347, 4.96273), Vector2(1.20961, 4.851479), Vector2(0.954045, 4.908136), Vector2(0.695865, 4.95134), Vector2(0.435779, 4.980973), Vector2(1.039558, 4.890738), Vector2(0.348782, 4.98782), Vector2(0.522642, 4.972609), Vector2(1.710101, 4.698462), Vector2(0.609347, 4.96273), Vector2(0.435779, 4.980973), Vector2(0.522642, 4.972609), Vector2(0.609347, 4.96273), Vector2(0.609347, 4.96273), Vector2(0.609347, 4.96273), Vector2(0.609347, 4.96273), Vector2(0.609347, 4.96273), Vector2(0.695865, 4.95134), Vector2(0.782172, 4.938442), Vector2(0.868241, 4.924039)], [Vector2(0.609347, 4.96273), Vector2(0.609347, 4.96273), Vector2(0.522642, 4.972609), Vector2(0.954045, 4.908136), Vector2(0.609347, 4.96273), Vector2(0.695865, 4.95134), Vector2(0.868241, 4.924039), Vector2(0.695865, 4.95134), Vector2(0.522642, 4.972609), Vector2(1.039558, 4.890738), Vector2(1.79184, 4.667902), Vector2(0.954045, 4.908136), Vector2(-1.378187, 4.806308), Vector2(-3.078307, 3.940054), Vector2(-2.5, 4.330127), Vector2(-2.723195, 4.193353), Vector2(-3.345653, 3.715724), Vector2(-4.09576, 2.867882), Vector2(-3.656768, 3.409992), Vector2(-3.596699, 3.473292), Vector2(-4.285837, 2.575191), Vector2(-4.806309, 1.378187), Vector2(-4.240241, 2.649596), Vector2(-4.635919, 1.873033), Vector2(-3.88573, -3.146602), Vector2(-4.698463, -1.710101), Vector2(-4.698463, 1.710101)], [Vector2(-1.039558, 4.890738), Vector2(-2.424048, 4.373098), Vector2(-2.191856, 4.49397), Vector2(0.609347, 4.96273), Vector2(-1.20961, 4.851479), Vector2(1.79184, 4.667902), Vector2(1.378187, 4.806308), Vector2(0.695866, 4.95134), Vector2(0, 5), Vector2(0.954045, 4.908136), Vector2(0.26168, 4.993147), Vector2(-1.79184, 4.667902), Vector2(-2.938926, 4.045085), Vector2(-4.602524, 1.953656), Vector2(-3.715724, 3.345653), Vector2(-4.414738, 2.347358), Vector2(-4.980974, -0.435779), Vector2(-4.727593, -1.627841), Vector2(-4.531539, -2.113091), Vector2(-4.806309, -1.378187), Vector2(-3.535534, -3.535534), Vector2(-4.727593, -1.627841), Vector2(-4.871851, 1.124756), Vector2(-4.373099, -2.424048), Vector2(-4.755283, -1.545085), Vector2(-4.414738, -2.347358), Vector2(-4.951341, -0.695865)], [Vector2(-3.009075, 3.993178), Vector2(-4.145188, 2.795965), Vector2(-3.773548, 3.280295), Vector2(-4.727593, 1.627841), Vector2(-4.908136, -0.954045), Vector2(-4.97261, 0.522643), Vector2(-4.373099, 2.424048), Vector2(-4.951341, -0.695865), Vector2(-4.698463, -1.710101), Vector2(-3.535534, 3.535534), Vector2(-4.851479, 1.20961), Vector2(-5, 0), Vector2(-4.829629, 1.294096), Vector2(-4.698463, -1.710101), Vector2(-4.871851, -1.124755), Vector2(-4.962731, 0.609347), Vector2(-4.851479, 1.20961), Vector2(-4.962731, -0.609347), Vector2(-4.851479, -1.209609), Vector2(-4.330127, -2.5), Vector2(-3.940054, -3.078307), Vector2(-3.830223, -3.213938), Vector2(-4.999239, -0.087262), Vector2(-4.924039, -0.868241), Vector2(-4.871851, -1.124755), Vector2(-4.871851, -1.124755), Vector2(-4.806309, -1.378187)], [Vector2(-4.145188, 2.795964), Vector2(-4.727593, 1.627841), Vector2(-3.146602, 3.88573), Vector2(-3.88573, 3.146602), Vector2(-3.078307, 3.940054), Vector2(-3.596699, 3.473292), Vector2(-3.345653, 3.715724), Vector2(-3.715724, 3.345653), Vector2(-4.97261, 0.522643), Vector2(-4.755283, -1.545085), Vector2(-4.987821, -0.348782), Vector2(-4.924039, 0.868241), Vector2(-4.567727, 2.033684), Vector2(-4.373099, 2.424048), Vector2(-4.938442, 0.782173), Vector2(-4.755283, 1.545085), Vector2(-4.240241, 2.649596), Vector2(-3.940054, 3.078308), Vector2(-4.781524, 1.461859), Vector2(-4.908136, -0.954045), Vector2(-4.285837, -2.57519), Vector2(-4.871851, -1.124755), Vector2(-4.996954, 0.174498), Vector2(-4.980974, -0.435779), Vector2(-4.97261, -0.522642), Vector2(-4.993148, -0.26168), Vector2(-4.993148, -0.26168)], [Vector2(-4.602524, 1.953656), Vector2(-3.830222, 3.213938), Vector2(-2.795964, 4.145188), Vector2(-2.347358, 4.414738), Vector2(-1.545085, 4.755282), Vector2(-2.191856, 4.49397), Vector2(-2.347358, 4.414738), Vector2(-3.409992, 3.656769), Vector2(-4.531539, 2.113092), Vector2(-4.829629, 1.294096), Vector2(-4.806309, 1.378187), Vector2(-4.455033, 2.269953), Vector2(-3.535534, 3.535534), Vector2(-2.5, 4.330127), Vector2(-3.280295, 3.773548), Vector2(-2.5, 4.330127), Vector2(-2.191856, 4.49397), Vector2(-2.424048, 4.373098), Vector2(-2.269953, 4.455032), Vector2(-4.635919, 1.873033), Vector2(-4.938442, 0.782173), Vector2(-4.951341, 0.695866), Vector2(-4.829629, -1.294095), Vector2(-4.890738, -1.039558), Vector2(-4.987821, -0.348782), Vector2(-4.97261, -0.522642), Vector2(-4.993148, -0.26168)], [Vector2(0, 5), Vector2(-1.873033, 4.635919), Vector2(-1.627841, 4.727592), Vector2(-0.954045, 4.908136), Vector2(-0.348782, 4.98782), Vector2(-1.294095, 4.829629), Vector2(-2.113091, 4.531538), Vector2(-2.347358, 4.414738), Vector2(-3.078307, 3.940054), Vector2(-2.723195, 4.193353), Vector2(-2.723195, 4.193353), Vector2(-2.033683, 4.567727), Vector2(-1.124755, 4.87185), Vector2(-1.873033, 4.635919), Vector2(-1.20961, 4.851479), Vector2(-1.953656, 4.602524), Vector2(-2.191856, 4.49397), Vector2(-1.209609, 4.851479), Vector2(-1.545085, 4.755282), Vector2(-3.078307, 3.940054), Vector2(-3.596699, 3.473292), Vector2(-4.373099, 2.424048), Vector2(-4.781524, 1.461859), Vector2(-2.795964, 4.145188), Vector2(-4.908136, 0.954045), Vector2(-4.890738, -1.039558), Vector2(-4.781524, -1.461859)], [Vector2(0.609347, 4.96273), Vector2(-2.269953, 4.455032), Vector2(-1.294095, 4.829629), Vector2(-0.348782, 4.98782), Vector2(-0.26168, 4.993147), Vector2(-1.124755, 4.87185), Vector2(-1.710101, 4.698462), Vector2(-2.113091, 4.531538), Vector2(-2.424048, 4.373098), Vector2(-1.873033, 4.635919), Vector2(-2.347358, 4.414738), Vector2(-1.124755, 4.87185), Vector2(-0.782172, 4.938442), Vector2(-1.461859, 4.781524), Vector2(-1.209609, 4.851479), Vector2(-2.033683, 4.567727), Vector2(-2.347358, 4.414738), Vector2(-2.191856, 4.49397), Vector2(-1.710101, 4.698462), Vector2(-2.938926, 4.045085), Vector2(-3.280295, 3.773548), Vector2(-2.191856, 4.49397), Vector2(-1.873033, 4.635919), Vector2(-3.146602, 3.88573), Vector2(-4.908136, 0.954045), Vector2(-4.962731, -0.609347), Vector2(-4.908136, -0.954045)], [Vector2(-0.174497, 4.996954), Vector2(-1.20961, 4.851479), Vector2(-0.348782, 4.98782), Vector2(0, 5), Vector2(-0.435779, 4.980973), Vector2(-1.124755, 4.87185), Vector2(-0.868241, 4.924039), Vector2(-0.609347, 4.96273), Vector2(-1.294095, 4.829629), Vector2(-1.461859, 4.781524), Vector2(-1.953655, 4.602524), Vector2(-0.695865, 4.95134), Vector2(-0.522642, 4.972609), Vector2(-0.954045, 4.908136), Vector2(-1.039558, 4.890738), Vector2(-1.378187, 4.806308), Vector2(-1.873033, 4.635919), Vector2(-1.79184, 4.667902), Vector2(-1.627841, 4.727592), Vector2(-2.113091, 4.531538), Vector2(-2.113091, 4.531538), Vector2(-2.649596, 4.24024), Vector2(-3.940054, 3.078308), Vector2(-4.49397, 2.191856), Vector2(-4.924039, 0.868241), Vector2(-5, 0), Vector2(0, 5)]]
var flowGrid = [[Vector2(4.698463, 1.710101), Vector2(0.522642, 4.972609), Vector2(0.522642, 4.972609), Vector2(0.782172, 4.938442), Vector2(1.039558, 4.890738), Vector2(0.609347, 4.96273), Vector2(1.20961, 4.851479), Vector2(0.609347, 4.96273), Vector2(1.20961, 4.851479), Vector2(0.954045, 4.908136), Vector2(0.695865, 4.95134), Vector2(0.435779, 4.980973), Vector2(1.039558, 4.890738), Vector2(0.348782, 4.98782), Vector2(0.522642, 4.972609), Vector2(1.710101, 4.698462), Vector2(0.609347, 4.96273), Vector2(0.435779, 4.980973), Vector2(0.522642, 4.972609), Vector2(0.609347, 4.96273), Vector2(0.609347, 4.96273), Vector2(0.609347, 4.96273), Vector2(0.609347, 4.96273), Vector2(0.609347, 4.96273), Vector2(0.695865, 4.95134), Vector2(0.782172, 4.938442), Vector2(0.868241, 4.924039)], [Vector2(0.609347, 4.96273), Vector2(0.609347, 4.96273), Vector2(0.522642, 4.972609), Vector2(0.954045, 4.908136), Vector2(0.609347, 4.96273), Vector2(0.695865, 4.95134), Vector2(0.868241, 4.924039), Vector2(0.695865, 4.95134), Vector2(0.522642, 4.972609), Vector2(1.039558, 4.890738), Vector2(1.79184, 4.667902), Vector2(0.954045, 4.908136), Vector2(-1.378187, 4.806308), Vector2(-3.078307, 3.940054), Vector2(-2.5, 4.330127), Vector2(-2.723195, 4.193353), Vector2(-3.345653, 3.715724), Vector2(-4.09576, 2.867882), Vector2(-3.656768, 3.409992), Vector2(-3.596699, 3.473292), Vector2(-4.285837, 2.575191), Vector2(-4.806309, 1.378187), Vector2(-4.240241, 2.649596), Vector2(-4.635919, 1.873033), Vector2(-3.88573, -3.146602), Vector2(-4.698463, -1.710101), Vector2(-4.698463, 1.710101)], [Vector2(-1.039558, 4.890738), Vector2(-2.424048, 4.373098), Vector2(-2.191856, 4.49397), Vector2(0.609347, 4.96273), Vector2(-1.20961, 4.851479), Vector2(1.79184, 4.667902), Vector2(1.378187, 4.806308), Vector2(0.695866, 4.95134), Vector2(0, 5), Vector2(0.954045, 4.908136), Vector2(0.26168, 4.993147), Vector2(-1.79184, 4.667902), Vector2(-2.938926, 4.045085), Vector2(-4.602524, 1.953656), Vector2(-3.715724, 3.345653), Vector2(-4.414738, 2.347358), Vector2(-4.980974, -0.435779), Vector2(-4.727593, -1.627841), Vector2(-4.531539, -2.113091), Vector2(-4.806309, -1.378187), Vector2(-3.535534, -3.535534), Vector2(-4.727593, -1.627841), Vector2(-4.871851, 1.124756), Vector2(-4.373099, -2.424048), Vector2(-4.755283, -1.545085), Vector2(-4.414738, -2.347358), Vector2(-4.951341, -0.695865)], [Vector2(-3.009075, 3.993178), Vector2(-4.145188, 2.795965), Vector2(-3.773548, 3.280295), Vector2(-4.727593, 1.627841), Vector2(-4.908136, -0.954045), Vector2(-4.97261, 0.522643), Vector2(-4.373099, 2.424048), Vector2(-4.951341, -0.695865), Vector2(-4.698463, -1.710101), Vector2(-3.535534, 3.535534), Vector2(-4.851479, 1.20961), Vector2(-5, 0), Vector2(-4.829629, 1.294096), Vector2(-4.698463, -1.710101), Vector2(-4.871851, -1.124755), Vector2(-4.962731, 0.609347), Vector2(-4.851479, 1.20961), Vector2(-4.962731, -0.609347), Vector2(-4.851479, -1.209609), Vector2(-4.330127, -2.5), Vector2(-3.940054, -3.078307), Vector2(-3.830223, -3.213938), Vector2(-4.999239, -0.087262), Vector2(-4.924039, -0.868241), Vector2(-4.871851, -1.124755), Vector2(-4.871851, -1.124755), Vector2(-4.806309, -1.378187)], [Vector2(-4.145188, 2.795964), Vector2(-4.727593, 1.627841), Vector2(-3.146602, 3.88573), Vector2(-3.88573, 3.146602), Vector2(-3.078307, 3.940054), Vector2(-3.596699, 3.473292), Vector2(-3.345653, 3.715724), Vector2(-3.715724, 3.345653), Vector2(-4.97261, 0.522643), Vector2(-4.755283, -1.545085), Vector2(-4.987821, -0.348782), Vector2(-4.924039, 0.868241), Vector2(-4.567727, 2.033684), Vector2(-4.373099, 2.424048), Vector2(-4.938442, 0.782173), Vector2(-4.755283, 1.545085), Vector2(-4.240241, 2.649596), Vector2(-3.940054, 3.078308), Vector2(-4.781524, 1.461859), Vector2(-4.908136, -0.954045), Vector2(-4.285837, -2.57519), Vector2(-4.871851, -1.124755), Vector2(-4.996954, 0.174498), Vector2(-4.980974, -0.435779), Vector2(-4.97261, -0.522642), Vector2(-4.993148, -0.26168), Vector2(-4.993148, -0.26168)], [Vector2(-4.602524, 1.953656), Vector2(-3.830222, 3.213938), Vector2(-2.795964, 4.145188), Vector2(-2.347358, 4.414738), Vector2(-1.545085, 4.755282), Vector2(-2.191856, 4.49397), Vector2(-2.347358, 4.414738), Vector2(-3.409992, 3.656769), Vector2(-4.531539, 2.113092), Vector2(-4.829629, 1.294096), Vector2(-4.806309, 1.378187), Vector2(-4.455033, 2.269953), Vector2(-3.535534, 3.535534), Vector2(-2.5, 4.330127), Vector2(-3.280295, 3.773548), Vector2(-2.5, 4.330127), Vector2(-2.191856, 4.49397), Vector2(-2.424048, 4.373098), Vector2(-2.269953, 4.455032), Vector2(-4.635919, 1.873033), Vector2(-4.938442, 0.782173), Vector2(-4.951341, 0.695866), Vector2(-4.829629, -1.294095), Vector2(-4.890738, -1.039558), Vector2(-4.987821, -0.348782), Vector2(-4.97261, -0.522642), Vector2(-4.993148, -0.26168)], [Vector2(0, 5), Vector2(-1.873033, 4.635919), Vector2(-1.627841, 4.727592), Vector2(-0.954045, 4.908136), Vector2(-0.348782, 4.98782), Vector2(-1.294095, 4.829629), Vector2(-2.113091, 4.531538), Vector2(-2.347358, 4.414738), Vector2(-3.078307, 3.940054), Vector2(-2.723195, 4.193353), Vector2(-2.723195, 4.193353), Vector2(-2.033683, 4.567727), Vector2(-1.124755, 4.87185), Vector2(-1.873033, 4.635919), Vector2(-1.20961, 4.851479), Vector2(-1.953656, 4.602524), Vector2(-2.191856, 4.49397), Vector2(-1.209609, 4.851479), Vector2(-1.545085, 4.755282), Vector2(-3.078307, 3.940054), Vector2(-3.596699, 3.473292), Vector2(-4.373099, 2.424048), Vector2(-4.781524, 1.461859), Vector2(-2.795964, 4.145188), Vector2(-4.908136, 0.954045), Vector2(-4.890738, -1.039558), Vector2(-4.781524, -1.461859)], [Vector2(0.609347, 4.96273), Vector2(-2.269953, 4.455032), Vector2(-1.294095, 4.829629), Vector2(-0.348782, 4.98782), Vector2(-0.26168, 4.993147), Vector2(-1.124755, 4.87185), Vector2(-1.710101, 4.698462), Vector2(-2.113091, 4.531538), Vector2(-2.424048, 4.373098), Vector2(-1.873033, 4.635919), Vector2(-2.347358, 4.414738), Vector2(-1.124755, 4.87185), Vector2(-0.782172, 4.938442), Vector2(-1.461859, 4.781524), Vector2(-1.209609, 4.851479), Vector2(-2.033683, 4.567727), Vector2(-2.347358, 4.414738), Vector2(-2.191856, 4.49397), Vector2(-1.710101, 4.698462), Vector2(-2.938926, 4.045085), Vector2(-3.280295, 3.773548), Vector2(-2.191856, 4.49397), Vector2(-1.873033, 4.635919), Vector2(-3.146602, 3.88573), Vector2(-4.908136, 0.954045), Vector2(-4.962731, -0.609347), Vector2(-4.908136, -0.954045)], [Vector2(-0.174497, 4.996954), Vector2(-1.20961, 4.851479), Vector2(-0.348782, 4.98782), Vector2(0, 5), Vector2(-0.435779, 4.980973), Vector2(-1.124755, 4.87185), Vector2(-0.868241, 4.924039), Vector2(-0.609347, 4.96273), Vector2(-1.294095, 4.829629), Vector2(-1.461859, 4.781524), Vector2(-1.953655, 4.602524), Vector2(-0.695865, 4.95134), Vector2(-0.522642, 4.972609), Vector2(-0.954045, 4.908136), Vector2(-1.039558, 4.890738), Vector2(-1.378187, 4.806308), Vector2(-1.873033, 4.635919), Vector2(-1.79184, 4.667902), Vector2(-1.627841, 4.727592), Vector2(-2.113091, 4.531538), Vector2(-2.113091, 4.531538), Vector2(-2.649596, 4.24024), Vector2(-3.940054, 3.078308), Vector2(-4.49397, 2.191856), Vector2(-4.924039, 0.868241), Vector2(-5, 0), Vector2(0, 5)]]

var gridStep = 75  # grid step in pixels
var gridWidth
var gridHeight
var windArrowTexture = preload("res://wind_arrow.png")
var flowArrowTexture = preload("res://farrow.png")
var windSprites = []
var flowSprites = []

var rng = RandomNumberGenerator.new()
var flowDir = 180
var flowSpeed = 1.2
var flow_vec = Vector2(0, 0)

var windDir = 180
var windSpeed = 5
var wind_vec = Vector2(0, 1)

var velocity = 0
var boat_dir = Vector2(0, -1)
var boat_vel = Vector2(0, 0)
var mass = 0

var endpoints = []
var epSprites = []
var loctexture = preload("res://location.png")
var ship_texture = preload("res://ship.png")
var noise = OpenSimplexNoise.new()
var ship_sp = Sprite.new()

var coast_matrix = []
var is1 = [Vector2(1507.499878, 249.159119), Vector2(1499.640869, 256.010498), Vector2(1508.9104, 282.20694), Vector2(1518.38147, 298.932373), Vector2(1533.686279, 316.973969), Vector2(1573.988525, 347.805176), Vector2(1638.27063, 359.895874), Vector2(1640.615723, 364.669159), Vector2(1675.678711, 370.311462), Vector2(1684.94812, 365.676697), Vector2(1696.03125, 338.271179), Vector2(1720.212646, 341.898376), Vector2(1723.436768, 339.07724), Vector2(1686.358765, 326.180511), Vector2(1662.580444, 322.626343), Vector2(1652.101807, 325.044495), Vector2(1632.555298, 337.739685), Vector2(1632.152222, 312.147766), Vector2(1611.598145, 310.737183), Vector2(1613.814697, 294.213257), Vector2(1595.678711, 279.704468), Vector2(1559.098022, 240.048279), Vector2(1547.611816, 232.390854), Vector2(1534.916626, 233.398407), Vector2(1523.027466, 248.511749), Vector2(1514.765503, 251.937439)]
var is2 = [Vector2(0, 375.541992), Vector2(220, 349.541992), Vector2(213, 262.541992), Vector2(339, 248.541992), Vector2(608, 294.541992), Vector2(625, 267.541992), Vector2(650, 266.541992), Vector2(718, 315.541992), Vector2(776, 319.541992), Vector2(821, 266.541992), Vector2(867, 252.541992), Vector2(884, 232.541992), Vector2(898, 256.541992), Vector2(935, 237.541992), Vector2(928, 221.541992), Vector2(950, 212.541992), Vector2(955, 190.541992), Vector2(986, 215.541992), Vector2(986, 242.541992), Vector2(1003, 242.541992), Vector2(1031.161011, 264.541992), Vector2(1053.161011, 245.541992), Vector2(1071.161011, 253.541992), Vector2(1092.161011, 253.541992), Vector2(1099.161011, 265.541992), Vector2(1113.161011, 273.541992), Vector2(1177.161011, 273.541992), Vector2(1182.161011, 281.541992), Vector2(1210.161011, 279.541992), Vector2(1217.161011, 257.541992), Vector2(1291.161011, 210.541992), Vector2(1308.161011, 181.541992), Vector2(1353.161011, 170.541992), Vector2(1358.161011, 151.541992), Vector2(1373.161011, 162.541992), Vector2(1439.161011, 174.541992), Vector2(1456.161011, 153.541992), Vector2(1463.161011, 162.541992), Vector2(1474.161011, 151.541992), Vector2(1484.161011, 153.541992), Vector2(1529.161011, 187.541992), Vector2(1542.161133, 172.541992), Vector2(1550.161133, 176.541992), Vector2(1541.161133, 190.541992), Vector2(1565.161133, 208.541992), Vector2(1569.161133, 226.541992), Vector2(1559.161133, 233.541992), Vector2(1470.661133, 189.041992), Vector2(1534.661133, 257.041992), Vector2(1617.661133, 305.041992), Vector2(1717.661133, 351.041992), Vector2(1813.661133, 371.041992), Vector2(1826.661133, 352.041992), Vector2(1955.661133, 355.041992), Vector2(2033.661133, 470.041992), Vector2(2041.661133, 234.041992), Vector2(2024.661133, 212.041992), Vector2(1885.520996, 166.541992), Vector2(1932.520996, 189.541992), Vector2(2000.520996, 151.541992), Vector2(2076.520996, 122.541992), Vector2(2097.520996, 118.541992), Vector2(2098.520996, 98.541992), Vector2(2131.520996, 91.541992), Vector2(2131.520996, 5.541992), Vector2(1, 67), Vector2(2, 428)]
var is3 = [Vector2(1257.161011, 193.041992), Vector2(1295.161011, 252.041992), Vector2(1283.161011, 273.041992), Vector2(1312.161011, 326.041992), Vector2(1379.161011, 407.041992), Vector2(1494.161011, 493.041992), Vector2(1712.161133, 535.041992), Vector2(1721.161133, 547.041992), Vector2(1827.161133, 567.041992), Vector2(1857.161133, 551.041992), Vector2(1897.161133, 459.041992), Vector2(1976.161133, 476.041992), Vector2(1983.161133, 465.041992), Vector2(1820.161133, 417.041992), Vector2(1768.161133, 425.041992), Vector2(1683.161133, 472.041992), Vector2(1683.161133, 380.041992), Vector2(1616.161133, 379.041992), Vector2(1620.161133, 321.041992), Vector2(1586.161133, 297.041992), Vector2(1447.161011, 147.041992), Vector2(1407.161011, 118.041992), Vector2(1363.161011, 127.041992), Vector2(1329.161011, 167.041992), Vector2(1300.161011, 181.041992), Vector2(1276.161011, 170.041992)]

var ship = []
var ship_vel = 2.5
var ship_path = [Vector2(1964, 352), Vector2(1763, 367), Vector2(1677, 383), Vector2(1563.371094, 353.107178), Vector2(1536.885986, 330.213287), Vector2(1476.845825, 258.950684), Vector2(1438.240479, 239.199097), Vector2(1389.759277, 245.932587), Vector2(1300.232666, 280.049011), Vector2(1215.341919, 325.282501), Vector2(1148.006958, 348.176392), Vector2(1054.510132, 348.625305), Vector2(984.48175, 335.607178), Vector2(772.510864, 334.260498), Vector2(633.226196, 310.468811), Vector2(562.006226, 301.041901), Vector2(439.00766, 278.596893), Vector2(383.246826, 272.312286), Vector2(310.525024, 280.392487), Vector2(258.452637, 307.326477), Vector2(223.887344, 348.625305)]

var poly_as = []
var poly = [Vector2(212.242828, 268.157318), Vector2(223.521454, 350.716766), Vector2(333.600708, 311.467194), Vector2(368.789978, 276.277924), Vector2(396.796997, 275.826782), Vector2(556.051025, 304.248871), Vector2(693.496826, 325.903809), Vector2(748.325195, 338.535858), Vector2(792.988525, 350.265625), Vector2(816.593201, 362.446533), Vector2(846.819885, 362.446533), Vector2(869.828247, 372.822845), Vector2(900.054932, 374.17627), Vector2(916.747314, 365.153381), Vector2(945.169434, 366.506836), Vector2(980.358643, 354.777069), Vector2(990.283875, 356.130493), Vector2(1029.984619, 382.296875), Vector2(1042.856445, 380.49231), Vector2(1056.841919, 396.733521), Vector2(1073.985474, 399.440369), Vector2(1088.422119, 403.04953), Vector2(1105.565552, 396.282349), Vector2(1116.393066, 385.003723), Vector2(1158.349487, 375.529724), Vector2(1168.390869, 368.762543), Vector2(1203.129028, 353.874756), Vector2(1219.566406, 362.446533), Vector2(1250.695435, 362.897644), Vector2(1279.117554, 330.415253), Vector2(1308.638184, 334.926697), Vector2(1347.436523, 345.75415), Vector2(1369.091553, 334.024414), Vector2(1383.979248, 297.481689), Vector2(1453.993774, 267.255035), Vector2(1465.868774, 276.277924), Vector2(1486.62146, 282.142792), Vector2(1523.615234, 322.294678), Vector2(1537.149658, 342.596161), Vector2(1558.353394, 357.935059), Vector2(1577.301514, 367.409119), Vector2(1690.538696, 394.026642), Vector2(1708.882446, 394.171814), Vector2(1699.859497, 401.841278), Vector2(1729.63501, 463.19693), Vector2(1763.470947, 465.001526), Vector2(1799.369751, 452.369446), Vector2(1810.648315, 454.174042), Vector2(1821.47583, 465.001526), Vector2(1848.093262, 467.708374), Vector2(1871.552856, 484.851868), Vector2(1886.891724, 494.777039), Vector2(1902.230713, 488.91217), Vector2(1910.351318, 478.987), Vector2(1918.471924, 483.498413), Vector2(1917.56958, 508.762512), Vector2(1919.825317, 513.361084), Vector2(1920.727539, 541.332031), Vector2(1913.058105, 574.265625), Vector2(1908.546631, 586.446533), Vector2(1899.072632, 652.313599), Vector2(1967.646606, 652.764771), Vector2(1968.097778, 140.38176), Vector2(1943.735962, 148.502365), Vector2(1941.029053, 158.878693), Vector2(1889.598633, 171.059586), Vector2(1843.130737, 199.030548), Vector2(1833.205566, 205.797714), Vector2(1802.978882, 191.812225), Vector2(1761.473633, 272.115967), Vector2(1766.436157, 280.148926), Vector2(1763.729248, 348.7229), Vector2(1757.86438, 349.174042), Vector2(1753.353027, 313.53363), Vector2(1753.353027, 281.051208), Vector2(1746.585815, 276.539764), Vector2(1714.554565, 274.735199), Vector2(1723.126343, 294.585571), Vector2(1739.367554, 314.887054), Vector2(1736.660645, 317.142761), Vector2(1697.862183, 320.751953), Vector2(1667.370239, 315.636627), Vector2(1637.594727, 300.297729), Vector2(1610.977173, 284.958801), Vector2(1582.555054, 257.438995), Vector2(1559.997803, 233.52832), Vector2(1564.574707, 213.496216), Vector2(1540.213013, 191.390137), Vector2(1514.046631, 178.758087), Vector2(1482.917603, 152.140564), Vector2(1463.518433, 164.772614), Vector2(1453.593262, 156.652008), Vector2(1436.449707, 175.148926), Vector2(1407.496826, 169.735199), Vector2(1372.758789, 164.321472), Vector2(1361.931274, 152.140564), Vector2(1354.261841, 158.005432), Vector2(1352.908447, 169.735199), Vector2(1330.351196, 178.758087), Vector2(1309.598511, 184.171814), Vector2(1300.124512, 192.743561), Vector2(1294.259644, 206.277893), Vector2(1280.72522, 213.947357), Vector2(1234.257324, 252.745789), Vector2(1214.858154, 259.964111), Vector2(1209.05188, 282.07019), Vector2(1184.617432, 281.786255), Vector2(1178.301514, 274.567963), Vector2(1112.885498, 276.823669), Vector2(1092.583984, 254.71759), Vector2(1074.087036, 256.071045), Vector2(1054.236694, 248.401581), Vector2(1031.679443, 265.996216), Vector2(1006.190125, 252.913025), Vector2(998.971802, 244.341278), Vector2(984.535217, 244.792419), Vector2(982.27948, 218.626038), Vector2(954.759644, 199.226822), Vector2(951.150513, 215.016876), Vector2(928.142151, 224.039764), Vector2(935.360474, 241.183258), Vector2(897.464294, 257.424469), Vector2(885.152649, 234.416107), Vector2(863.948853, 257.424469), Vector2(826.503906, 267.800781), Vector2(778.682556, 319.682404), Vector2(751.701538, 322.389282), Vector2(718.767944, 318.780121), Vector2(672.30011, 282.237427), Vector2(646.584839, 268.703064), Vector2(623.009155, 271.861084), Vector2(609.474792, 294.869446), Vector2(563.458069, 290.809143), Vector2(441.98407, 268.251953), Vector2(397.771912, 261.03363), Vector2(359.948853, 262.387054), Vector2(337.391602, 250.206146)]
var path_poly = [Vector2(784.095825, 335.882874), Vector2(886.445068, 289.421692), Vector2(967.24707, 267.201172), Vector2(1056.802612, 298.175262), Vector2(1151.744995, 304.908752), Vector2(1217.521973, 296.155212), Vector2(1262.636353, 258.447632), Vector2(1307.43457, 223.433411), Vector2(1366.016113, 204.579605), Vector2(1438.064575, 202.559555), Vector2(1485.198975, 190.43924), Vector2(1539.740479, 218.0466), Vector2(1554.770752, 233.086121), Vector2(1587.415527, 266.033203), Vector2(1614.921875, 292.330414), Vector2(1665.720337, 318.898438), Vector2(1733.428101, 332.500427), Vector2(1748.647339, 360.135193), Vector2(1797.161133, 366.936188), Vector2(1794.213989, 253.586121), Vector2(1864.999878, 196.041992), Vector2(1913.999878, 172.041992), Vector2(1957.999878, 177.041992), Vector2(1964.999878, 648.041992), Vector2(1903.999878, 651.041992), Vector2(1917.410034, 585.25), Vector2(1928.800049, 516.23999), Vector2(1922.100098, 473.359985), Vector2(1897.97998, 480.059998), Vector2(1880.560059, 481.400024), Vector2(1857.780029, 461.970001), Vector2(1828.300049, 455.940002), Vector2(1808.200073, 445.220001), Vector2(1761.970093, 455.27002), Vector2(1735.840088, 455.940002), Vector2(1713.060059, 419.76001), Vector2(1719.370972, 384.281982), Vector2(1653.041016, 376.242004), Vector2(1612.171021, 364.182007), Vector2(1571.970947, 356.141998), Vector2(1539.811035, 332.021973), Vector2(1511.000977, 299.191986), Vector2(1487.130981, 267.002014), Vector2(1446.260986, 258.291992), Vector2(1378.331055, 277.721985), Vector2(1354.880981, 322.612), Vector2(1282.520996, 307.201996), Vector2(1244.680908, 343.382019), Vector2(1197.110962, 340.701996), Vector2(1146.460938, 368.84201), Vector2(1093.531006, 375.541992), Vector2(1031.190918, 371.522003), Vector2(992.330994, 340.701996), Vector2(953.470947, 350.752014), Vector2(914.060974, 359.462006), Vector2(849.070984, 354.10199)]
var path_found = []

var rotSpeed = 55
var running = false

var speed_dep = [0, 0, 0, 2.5, 5, 6.2, 7.1, 7.9, 8, 8.1, 8, 7.9, 7.8, 7.7, 7.6, 7.5, 7.4, 7.3, 7.2, 7]

var lh = Vector2(0,1)
var rh = Vector2(0,1)

var boatTrail = []

func _draw():
	for i in range(path_found.size()-1):
		draw_line(path_found[i], path_found[i+1], Color(0,0,250), 1)
	
	"""
	for i in range(path_poly.size()):
		if IsVertexConcave(path_poly, i):
			continue
		for j in range(path_poly.size()):
			if i < j and !IsVertexConcave(path_poly, j) and is_in_LOS(path_poly[i], path_poly[j]):
				draw_line(path_poly[i], path_poly[j], Color(250, 0, 0), 1)
	
	for i in range(path_poly.size()):
		draw_line(path_poly[i], path_poly[(i+1)%path_poly.size()], Color(0, 200, 0), 3)
	
	for i in range(poly.size()):
		draw_line(poly[i], poly[(i+1)%poly.size()], Color(0, 200, 0), 3)
	
	for i in range(poly_as.size()):
		draw_line(poly_as[i], poly_as[(i+1)%poly_as.size()], Color(0, 200, 0), 3)
	"""
	if boatTrail.size() > 1:
		for i in range(1, boatTrail.size(), 2):
			draw_line(boatTrail[i-1], boatTrail[i], Color(0, 0, 0), 1)
	if endpoints.size() > 0:
		draw_line(endpoints[0], endpoints[0]-lh*10, Color(255, 0, 0), 1)
		draw_line(endpoints[0], endpoints[0]-rh*10, Color(0, 255, 0), 1)

var astar = PFAStar.new()

func _ready():
	for i in range(path_poly.size()):
		astar.add_point(i, Vector3(path_poly[i].x, path_poly[i].y, 0))
	
	for i in range(path_poly.size()):
		if IsVertexConcave(path_poly, i):
			pass
		for j in range(path_poly.size()):
			#if i < j and !IsVertexConcave(path_poly, j) and is_in_LOS(path_poly[i], path_poly[j]):
			if i < j and is_in_LOS(path_poly[i], path_poly[j]):
				astar.connect_points(i, j)
	
	rng.randomize()
	
	noise.seed = rng.randi()
	noise.octaves = 3
	noise.period = 250.0
	noise.persistence = 0.8
	
	gridHeight = $background.texture.get_height()/gridStep + 1
	gridWidth = $background.texture.get_width()/gridStep + 1
	
	for i in range(gridHeight):
		for j in range(gridWidth):
			var sprite = Sprite.new()
			sprite.texture = windArrowTexture
			sprite.position = Vector2((j+0.5)*gridStep, (i+0.5)*gridStep)
			sprite.scale = Vector2(1, 1) * windGrid[i][j].length() / 10
			sprite.flip_v = true
			sprite.z_index = -2
			windSprites.append(sprite)
			add_child(sprite)
	
	ship_sp.texture = ship_texture
	ship_sp.position = ship_path[0]
	ship_sp.scale = Vector2(0.12, 0.08)
	ship_sp.z_index = 1
	add_child(ship_sp)
	
	for i in range(gridHeight):
		for j in range(gridWidth):
			var sprite = Sprite.new()
			sprite.texture = flowArrowTexture
			sprite.position = Vector2((j+0.5)*gridStep, (i+0.5)*gridStep)
			sprite.scale = Vector2(1, 1) * flowGrid[i][j].length() / 10
			sprite.flip_v = true
			sprite.z_index = -2
			flowSprites.append(sprite)
			add_child(sprite)

func save(content):
	var file = File.new()
	file.open("user://save_game.txt", File.WRITE)
	file.store_string(str(content))
	file.close()

func add_point_astar(id, p: Vector2):
	for i in range(path_poly.size()):
		if is_in_LOS(p, path_poly[i]):
			astar.connect_points(i, id)

func rm_point_astar(id, p: Vector2):
	for i in range(path_poly.size()):
		if is_in_LOS(p, path_poly[i]):
			astar.disconnect_points(i, id)

func find_a_path(pos):
	var n = path_poly.size()
	astar.add_point(n, Vector3($boat.position.x, $boat.position.y, 0))
	astar.add_point(n+1, Vector3(pos.x, pos.y, 0))
	add_point_astar(n, $boat.position)
	add_point_astar(n+1, pos)
	var path = astar.get_point_path(n, n+1)
	rm_point_astar(n, $boat.position)
	rm_point_astar(n+1, pos)
	path_found = []
	for p in path:
		path_found.append(Vector2(p.x, p.y))
	if is_in_LOS($boat.position, pos):
		path_found = [$boat.position, pos]

var rot_i = 0
var rot_j = 0

func _process(delta):
	mass = int($Camera2D/CanvasLayer/CargoMass.text)
	
	if Input.is_action_pressed("rot_cw"):
		windGrid[rot_i][rot_j] = rotate_vec(windGrid[rot_i][rot_j], PI/180)
	if Input.is_action_pressed("rot_ccw"):
		windGrid[rot_i][rot_j] = rotate_vec(windGrid[rot_i][rot_j], -PI/180)
	if Input.is_action_just_released("rot_next"):
		save(windGrid)
		rot_j += 1
		if rot_j == gridWidth:
			rot_j = 0
			rot_i += 1
		if rot_i == gridHeight:
			rot_i = 0
			rot_j = 0
	
	if Input.is_action_just_released("zoom_in"):
		$Camera2D.zoom *= 0.67
	if Input.is_action_just_released("zoom_out"):
		$Camera2D.zoom *= 1.5
	if $Camera2D.zoom.length() > 1.0:
		$Camera2D.zoom = Vector2(1, 1)
		
	$boat/Sprite.scale = $Camera2D.zoom * 0.07
	for sp in epSprites:
		sp.scale = $Camera2D.zoom * 0.03
	
	if Input.is_action_just_pressed("lock_camera"):
		isCameraLocked = !isCameraLocked
	
	if isCameraLocked:
		$Camera2D.position = $boat.position
	else:
		if Input.is_action_pressed("ui_left"):
			$Camera2D.position += Vector2(-cameraSpeed, 0)
		if Input.is_action_pressed("ui_right"):
			$Camera2D.position += Vector2(cameraSpeed, 0)
		if Input.is_action_pressed("ui_up"):
			$Camera2D.position += Vector2(0, -cameraSpeed)
		if Input.is_action_pressed("ui_down"):
			$Camera2D.position += Vector2(0, cameraSpeed)
	
	var rotDir = 0
	if Input.is_action_pressed("ui_left"):
		rotDir += -1
	if Input.is_action_pressed("ui_right"):
		rotDir += 1
		
	if Input.is_action_just_pressed("ui_lclick"):
		var pos = get_global_mouse_position()
		poly_as.append(pos)
		save(str(poly_as))
	
	if Input.is_action_just_pressed("ui_rclick"):
		var pos = get_global_mouse_position()
		var img = get_viewport().get_texture().get_data()
		img.flip_y()
		img.lock()
		endpoints.push_back(pos)
		var sp = Sprite.new()
		sp.set_texture(loctexture)
		sp.position = pos
		sp.scale = Vector2(0.03, 0.03)
		sp.z_index = 2
		epSprites.push_back(sp)
		add_child(sp)
		img.unlock()
	
	lh = rotate_vec(-wind_vec, PI/4).normalized() * 10
	rh = rotate_vec(-wind_vec, -PI/4).normalized() * 10
	
	var radvec = lh
	if path_found.size() == 0 and endpoints.size() > 0:
		find_a_path(endpoints[0])
	if path_found.size() > 1:
		radvec = path_found[1] - $boat.position
	if radvec.length() < 5:
		path_found[0] = path_found[1]
		path_found.remove(1)
		if path_found.size() > 1:
			radvec = path_found[1] - $boat.position
		else:
			if endpoints.size() > 1:
				endpoints.remove(0)
				remove_child(epSprites[0])
				epSprites.remove(0)
			find_a_path(endpoints[0])
			if path_found.size() > 1:
				radvec = path_found[1] - $boat.position
	
	var ang = acos(cosang(-radvec, wind_vec))
	if abs(ang) < PI/4: # upwind
		if acos(cosang(radvec-lh.normalized()*90, lh)) < PI/4:
			radvec = lh
		elif acos(cosang(radvec-rh.normalized()*90, rh)) < PI/4:
			radvec = rh
		else:
			if acos(cosang(boat_dir, lh)) < acos(cosang(boat_dir, rh)):
				radvec = lh
			else:
				radvec = rh
		var ld = douknowdawae(lh)
		var rd = douknowdawae(rh)
		var allowed_diff = min(ld, rd) / 2
		if endpoints.size() > 0 and min(ld, rd) < (endpoints[0] - $boat.position).length():
			if ld + allowed_diff < rd:
				radvec = rh
			elif ld > rd + allowed_diff:
				radvec = lh
	else: # downwind
		pass
	
	ang = asin(sinang(boat_dir, radvec))
	if abs(ang) < rotSpeed * delta / 180 * PI:
		rotDir = 0
		$Camera2D/CanvasLayer/MiniBoat.rotation += ang
	elif ang < 0:
		rotDir = -1
	else:
		rotDir = 1
		
	$Camera2D/CanvasLayer/MiniBoat.rotation_degrees += rotDir * rotSpeed * delta
	if $Camera2D/CanvasLayer/MiniBoat.rotation_degrees > 360:
		$Camera2D/CanvasLayer/MiniBoat.rotation_degrees -= 360
	if $Camera2D/CanvasLayer/MiniBoat.rotation_degrees < -360:
		$Camera2D/CanvasLayer/MiniBoat.rotation_degrees += 360
	
	#var aw = wind_vec - boat_vel
	#windDir = atan(-aw.x/aw.y)
	var newRot = windDir - $Camera2D/CanvasLayer/MiniBoat.rotation_degrees - 180
	if newRot > 180:
		newRot -= 360
	if newRot < -180:
		newRot += 360
		
	if newRot > 0:
		$Camera2D/CanvasLayer/MiniBoat/MainSail.flip_h = true
		$Camera2D/CanvasLayer/MiniBoat/Jib.flip_h = true
	else:
		$Camera2D/CanvasLayer/MiniBoat/MainSail.flip_h = false
		$Camera2D/CanvasLayer/MiniBoat/Jib.flip_h = false
		
	$Camera2D/CanvasLayer/MiniBoat/MainSail.rotation_degrees = newRot/2
	$Camera2D/CanvasLayer/MiniBoat/Jib.rotation_degrees = newRot/2
	
	var rv = 0
	if boat_vel.length()*flow_vec.length() > 0:
		flow_vec.length()*(boat_vel.dot(-flow_vec)/boat_vel.length()/flow_vec.length())
	var tar_v = sail_int()
	var dt = 0.0001 * (15 + mass*10) * (rv+velocity)
	var dv = (tar_v - velocity) * delta / (dt+delta)
	velocity = max(0, velocity + dv)
	
	boat_dir.x = sin($Camera2D/CanvasLayer/MiniBoat.rotation)
	boat_dir.y = -cos($Camera2D/CanvasLayer/MiniBoat.rotation)
	if not running:
		delta = 0
	boat_vel = boat_dir * velocity/windSpeed/2 / mapScale
	$boat.position += boat_vel * delta
	
	if ship_path.size() > 0:
		var shipvec = ship_path[0] - ship_sp.position
		if shipvec.length() < 3:
			ship_sp.position = ship_path[0]
			ship_path.remove(0)
		else:
			ship_sp.position += shipvec.normalized()*ship_vel*delta
			ship_sp.rotation = -acos(cosang(shipvec, Vector2(0,-1)))
	
	$Camera2D/CanvasLayer/BoatVelocityLabel.text = str(stepify(velocity/windSpeed/2, 0.01)) + " m/s"
	update()

func get_local_wind(loc: Vector2):
	var i = floor(loc.y / gridStep)
	var j = floor(loc.x / gridStep)
	return windGrid[i][j]

func get_local_flow(loc: Vector2):
	var i = floor(loc.y / gridStep)
	var j = floor(loc.x / gridStep)
	return flowGrid[i][j]

func sail_int():
	var rot = $Camera2D/CanvasLayer/MiniBoat/MainSail.rotation_degrees * 2
	rot = int(round(abs(rot/10)))
	return windSpeed*speed_dep[rot]*15.0/(15+mass)

func get_vector_rotation(vec):
	var ret = acos(cosang(Vector2(0, -1), vec))*180/PI
	if vec.x < 0:
		ret = 360 - ret
	return ret

func update_wind_flow():
	var localWindVec = get_local_wind($boat.position)
	windDir = get_vector_rotation(localWindVec)
	windSpeed = localWindVec.length()
	if windDir < 0:
		windDir += 360
	if windDir > 360:
		windDir -= 360
	$Camera2D/CanvasLayer/WindArrow.rotation_degrees = windDir
	$Camera2D/CanvasLayer/WindDegLabel.text = str(int(windDir+180)%360) + "°"
	$Camera2D/CanvasLayer/WindSpeedLabel.text = str(stepify(windSpeed, 0.1)) + " m/s"
	wind_vec.x = sin($Camera2D/CanvasLayer/WindArrow.rotation)
	wind_vec.y = -cos($Camera2D/CanvasLayer/WindArrow.rotation)
	wind_vec *= windSpeed
	
	var localFlowVec = get_local_flow($boat.position)
	flowDir = get_vector_rotation(localFlowVec)
	flowSpeed = localFlowVec.length()
	if flowDir < 0:
		flowDir += 360
	if flowDir > 360:
		flowDir -= 360
	$Camera2D/CanvasLayer/FlowArrow.rotation_degrees = flowDir
	$Camera2D/CanvasLayer/FlowDegLabel.text = str(int(flowDir+180)%360) + "°"
	$Camera2D/CanvasLayer/FlowSpeedLabel.text = str(stepify(flowSpeed, 0.1)) + " m/s"
	flow_vec.x = sin($Camera2D/CanvasLayer/FlowArrow.rotation)
	flow_vec.y = -cos($Camera2D/CanvasLayer/FlowArrow.rotation)
	flow_vec *= flowSpeed

func rotate_vec(vec: Vector2, a):
	return Vector2(vec.x*cos(a) - vec.y*sin(a), vec.x*sin(a) + vec.y*cos(a))

func isbetween(a, b, c):
	if (a.x * b.y - a.y * b.x)*(a.x * c.y - a.y * c.x) >= 0 and (c.x * b.y - c.y * b.x)*(c.x * a.y - c.y * a.x) >= 0:
		return true
	return false

func sinang(a, b):
	var cp = (a.x * b.y) - (a.y * b.x)
	return cp/a.length()/b.length()
	
func cosang(a, b):
	var dp = a.dot(b)
	return dp/a.length()/b.length()

func get_cross(a,b,c):
	var k = (b.x*a.y-b.y*a.x)/(b.y*(c.x-a.x)-b.x*(c.y-a.y))
	return (a+(c-a)*k).length()

func douknowdawae(b):
	var mind = INF
	var a = is1[is1.size()-1] - $boat.position
	var c = is1[0] - $boat.position
	if isbetween(a,b,c):
		mind = get_cross(a,b,c)
	for i in range(1,is1.size()):
		a = c
		c = is1[i] - $boat.position
		if isbetween(a,b,c):
			mind = min(mind, get_cross(a,b,c))
	a = poly[poly.size()-1] - $boat.position
	c = poly[0] - $boat.position
	if isbetween(a,b,c):
		mind = get_cross(a,b,c)
	for i in range(1,poly.size()):
		a = c
		c = poly[i] - $boat.position
		if isbetween(a,b,c):
			mind = min(mind, get_cross(a,b,c))
	return mind
	a = ship[3] - $boat.position
	c = ship[0] - $boat.position
	if isbetween(a,b,c):
		mind = get_cross(a,b,c)
	for i in range(1,4):
		a = c
		c = ship[i] - $boat.position
		if isbetween(a,b,c):
			mind = min(mind, get_cross(a,b,c))
	return mind

func dist(a: Vector2, b: Vector2):
	return (a-b).length()

func display_wind_grid():
	for sp in windSprites:
		sp.z_index = 2

func hide_wind_grid():
	for sp in windSprites:
		sp.z_index = -2

func display_flow_grid():
	for sp in flowSprites:
		sp.z_index = 2

func hide_flow_grid():
	for sp in flowSprites:
		sp.z_index = -2

var tot_angw = 0
var tot_angf = 0

func update_grid():
	var ind = 0
	var ang = rng.randf_range(-PI/180, PI/180)
	if tot_angw > PI*35/180:
		ang = -abs(ang)
	if tot_angw < -PI*35/180:
		ang = abs(ang)
	tot_angw += ang
	var mul = rng.randf_range(0.995, 1.005)
	for i in range(gridHeight):
		for j in range(gridWidth):
			windGrid[i][j] = rotate_vec(windGrid[i][j], ang)
			windGrid[i][j] *= mul
			windSprites[ind].rotation_degrees = get_vector_rotation(windGrid[i][j])
			ind+=1
	ind = 0
	ang = rng.randf_range(-PI/180, PI/180)
	if tot_angf > PI*35/180:
		ang = -abs(ang)
	if tot_angf < -PI*35/180:
		ang = abs(ang)
	tot_angf += ang
	mul = rng.randf_range(0.995, 1.005)
	for i in range(gridHeight):
		for j in range(gridWidth):
			flowGrid[i][j] = rotate_vec(flowGrid[i][j], ang)
			flowGrid[i][j] *= mul
			flowSprites[ind].rotation_degrees = get_vector_rotation(flowGrid[i][j])
			ind+=1

var showWindGrid = false
var showFlowGrid = false

func _on_GridToggleButton_button_down():
	showWindGrid = not showWindGrid
	if showWindGrid:
		display_wind_grid()
	else:
		hide_wind_grid()

func _on_FlowGridToggleButton_button_down():
	showFlowGrid = not showFlowGrid
	if showFlowGrid:
		display_flow_grid()
	else:
		hide_flow_grid()

func _on_MainTimer_timeout():
	update_grid()
	update_wind_flow()

func _on_StartButton_button_down():
	running = not running
	if running:
		$Camera2D/CanvasLayer/StartButton.text = "Stop simulation"
	else:
		$Camera2D/CanvasLayer/StartButton.text = "Start simulation"

func _on_Timer_timeout():
	if running:
		boatTrail.push_back($boat.position)


###  A*  ###

func is_intersecting(a: Vector2, b: Vector2, c: Vector2, d: Vector2):
	if a==c or a==d or b==c or b==d:
		return false
	var denominator = ((b.x - a.x) * (d.y - c.y)) - ((b.y - a.y) * (d.x - c.x))
	if denominator == 0:
		return false
	var numerator1 = ((a.y - c.y) * (d.x - c.x)) - ((a.x - c.x) * (d.y - c.y))
	var numerator2 = ((a.y - c.y) * (b.x - a.x)) - ((a.x - c.x) * (b.y - a.y))
	if (numerator1 == 0 || numerator2 == 0):
		return false
	var r = numerator1 / denominator
	var s = numerator2 / denominator
	return (r > 0 && r < 1) && (s > 0 && s < 1)

func IsVertexConcave(vertices, vertex):
	var current = vertices[vertex]
	var next = vertices[(vertex + 1) % vertices.size()]
	var previous
	if vertex == 0:
		previous = vertices[vertices.size() - 1]
	else:
		previous = vertices[vertex - 1]

	var left = Vector2(current.x - previous.x, current.y - previous.y)
	var right = Vector2(next.x - current.x, next.y - current.y)

	var cross = (left.x * right.y) - (left.y * right.x)

	return cross < 0

func is_in_poly(polygon, a: Vector2):
	var vec = Vector2(10000, a.y) - a
	var br = 0
	for i in range(polygon.size()):
		if is_intersecting(a, Vector2(10000, a.y), polygon[i], polygon[(i+1)%polygon.size()]):
			br += 1
	return br%2!=0

func is_in_LOS(a: Vector2, b: Vector2):
	for i in range(poly.size()):
		if is_intersecting(a, b, poly[i], poly[(i+1)%poly.size()]):
			return false
	for i in range(is1.size()):
		if is_intersecting(a, b, is1[i], is1[(i+1)%is1.size()]):
			return false
	return is_in_poly(poly, (a+b)/2) and !is_in_poly(is1, (a+b)/2)

class PFAStar:
	extends AStar
	func _dist(a: Vector3, b: Vector3):
		return (a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y)
	
	func cosang(a, b):
		var dp = a.dot(b)
		return dp/a.length()/b.length()
	
	func _compute_cost(u, v):
		var p = get_point_position(u)
		var q = get_point_position(v)
		var r = get_point_position(get_point_count()-2)
		var s = get_point_position(get_point_count()-1)
		if p==q or r==s:
			return 10
		return acos(cosang(Vector2(q.x-p.x, q.y-p.y), Vector2(s.x-r.x, s.y-r.y)))

	func _estimate_cost(u, v):
		return _compute_cost(u, v)
