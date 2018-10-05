// Auto-generated. Do not edit!

// (in-package graph_server.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GraphPathRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start = null;
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = 0;
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraphPathRequest
    // Serialize message field [start]
    bufferOffset = _serializer.uint64(obj.start, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = _serializer.uint64(obj.goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraphPathRequest
    let len;
    let data = new GraphPathRequest(null);
    // Deserialize message field [start]
    data.start = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'graph_server/GraphPathRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dea57c8f4ba4a012d050a4c9e1f99ab9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint64 start
    uint64 goal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraphPathRequest(null);
    if (msg.start !== undefined) {
      resolved.start = msg.start;
    }
    else {
      resolved.start = 0
    }

    if (msg.goal !== undefined) {
      resolved.goal = msg.goal;
    }
    else {
      resolved.goal = 0
    }

    return resolved;
    }
};

class GraphPathResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.path = null;
      this.lange = null;
    }
    else {
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
      if (initObj.hasOwnProperty('lange')) {
        this.lange = initObj.lange
      }
      else {
        this.lange = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraphPathResponse
    // Serialize message field [path]
    bufferOffset = _arraySerializer.uint64(obj.path, buffer, bufferOffset, null);
    // Serialize message field [lange]
    bufferOffset = _serializer.float32(obj.lange, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraphPathResponse
    let len;
    let data = new GraphPathResponse(null);
    // Deserialize message field [path]
    data.path = _arrayDeserializer.uint64(buffer, bufferOffset, null)
    // Deserialize message field [lange]
    data.lange = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.path.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'graph_server/GraphPathResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b9554f5687f705abdaaa928f25b9ba2f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint64[] path
    float32 lange
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraphPathResponse(null);
    if (msg.path !== undefined) {
      resolved.path = msg.path;
    }
    else {
      resolved.path = []
    }

    if (msg.lange !== undefined) {
      resolved.lange = msg.lange;
    }
    else {
      resolved.lange = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GraphPathRequest,
  Response: GraphPathResponse,
  md5sum() { return '94f3650515896f2f94175e3d490a0f76'; },
  datatype() { return 'graph_server/GraphPath'; }
};
