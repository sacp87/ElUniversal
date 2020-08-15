//
//  Constants.swift
//  PruebaElUniversal
//
//  Copyright © 2020 Silviano. All rights reserved.
//

import Foundation

class Constants {
    internal static let VERSION = 1
    internal static let INVALID_ID = -1
    internal static let ES_MODO_DESARROLLO = true
    internal static let STRING_EMPTY = ""
    class URL{
        internal static let SUCCESS = 1;
        internal static let ERROR_1 = 0;
        internal static let SUCCESS_MENSAJE = "Ok";
        internal static let TOKEN_CODE_ERROR = "UNAUTHENTICATED";
        internal static let TOKEN_MESSAGE_ERROR = "La sesión para este dispositvo ha caducado, vuelva a autentificarse";
        
        internal static let GET = "GET";
        internal static let IS_FRANZ_MAYER_SERVICES = true
        internal static let ID_USER_DEFAULT_URL = "url_base"
        
        internal static let URL_BASE = "https://api.eluniversal.com.mx/v3/notes/eluniversal/mxm/json/";
        internal static let END_POINT_NEWS = "espectaculos/";
    }
}
