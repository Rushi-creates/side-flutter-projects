/* -------------------------------------------------------------------------- */
/* //! Database class contains,all 4CRUD funcs ,which we'll call in UI, using */
/*             //?    DBHelper.dbHelperObj.funcName()                         */
/* -------------------------------------------------------------------------- */
/*   //! VsCode > create utils folder > create database_helper.dart > paste   */
/* -------------------------------------------------------------------------- */
/*  //Todo: Download req dependencies in pubspec.yaml (firestore & firebase)  */
/* -------------------------------------------------------------------------- */

import 'package:cloud_firestore/cloud_firestore.dart';

class DBHelper {
/* -------------------------------------------------------------------------- */
/*                      //! Making class singleton                            */
/* -------------------------------------------------------------------------- */

  DBHelper._instance();

  static final DBHelper dbHelperObj = DBHelper._instance();

/* --------------------------------------------------------------------------*/
/* --------------------------------------------------------------------------*/
/*                    //!  5 CRUD FUNCTIONS BELOW :                          */
/* --------------------------------------------------------------------------*/
/* --------------------------------------------------------------------------*/

/* ----------------------------------------------------------------------------------*/
/*                        //!  INSERT : ( using add() method )                       */
/*//mapArg takes data in map format{'key1' : value1}, that needs to be inserted in DB*/
/* ----------------------------------------------------------------------------------*/

  Future<void> add(pathArg, modelObjArg) {
    return pathArg
        .add(modelObjArg.toMap())
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

/* ----------------------------------------------------------------------------------*/
/*                     //!  INSERT : (using set() method )                            */
/*//mapArg takes data in map format{'key1' : value1}, that needs to be inserted in DB*/
/* ----------------------------------------------------------------------------------*/

  Future<void> set(pathArg, modelObjArg) {
    return pathArg
        .set(modelObjArg.toMap())
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

/* -------------------------------------------------------------------------------------*/
/*                               //!  UPDATE :                                          */
/*        //idArg takes the id/name of document , that needs to be updated              */
/*  //mapArg takes data in map format{'key1' : value1}, that needs to be updated in DB, */
/* ------------------------------------------------------------------------------------ */

  Future<void> update(pathArg, modelObjArg) {
    return pathArg
        .update(modelObjArg.toMap())
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

/* ----------------------------------------------------------------------------------*/
/*                             //!  DELETE :                                         */
/*          //idArg takes the id/name of document , that needs to be deleted         */
/* ----------------------------------------------------------------------------------*/

  Future<void> delete(pathArg) {
    return pathArg
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }
}
