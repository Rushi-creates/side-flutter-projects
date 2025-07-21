
class RowModel {
  late int _id ;
  late String title ;
  late String _subtitle ;
  late int _priority ;

  RowModel.namedConst() ;

  RowModel(this.title ,this._subtitle , this._priority) ;
  RowModel.withId ( this._id, this.title ,this._subtitle, this._priority) ;

  int get id => _id;

  Map<String,dynamic> toMapFunc( ) {
    var map1 =Map<String , dynamic> ( ) ;
    if (id  != null ) {
      map1['id'] = _id ;
    }
    map1['keyName1'] = title ;
    map1['keyName2'] = _subtitle ;
    map1['keyName3'] = _priority ;

    return map1 ;
  }

  RowModel.fromMapObject( Map<String,dynamic> map1 ) {
    this._id = map1["id"] ;
    this.title = map1['keyName1'] ;
    this._subtitle = map1['keyName2'] ;
    this._priority = map1['keyName3'] ;


  }

}