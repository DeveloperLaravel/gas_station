// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVehicleIsarModelCollection on Isar {
  IsarCollection<VehicleIsarModel> get vehicleIsarModels => this.collection();
}

const VehicleIsarModelSchema = CollectionSchema(
  name: r'VehicleIsarModel',
  id: -6687009824319211325,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'normalizedPlateNumber': PropertySchema(
      id: 1,
      name: r'normalizedPlateNumber',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(id: 2, name: r'notes', type: IsarType.string),
    r'ownerName': PropertySchema(
      id: 3,
      name: r'ownerName',
      type: IsarType.string,
    ),
    r'plateNumber': PropertySchema(
      id: 4,
      name: r'plateNumber',
      type: IsarType.string,
    ),
    r'qrCode': PropertySchema(id: 5, name: r'qrCode', type: IsarType.string),
  },

  estimateSize: _vehicleIsarModelEstimateSize,
  serialize: _vehicleIsarModelSerialize,
  deserialize: _vehicleIsarModelDeserialize,
  deserializeProp: _vehicleIsarModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'normalizedPlateNumber': IndexSchema(
      id: 603473801253088961,
      name: r'normalizedPlateNumber',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'normalizedPlateNumber',
          type: IndexType.hash,
          caseSensitive: false,
        ),
      ],
    ),
    r'qrCode': IndexSchema(
      id: 4920222878361108799,
      name: r'qrCode',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'qrCode',
          type: IndexType.hash,
          caseSensitive: false,
        ),
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _vehicleIsarModelGetId,
  getLinks: _vehicleIsarModelGetLinks,
  attach: _vehicleIsarModelAttach,
  version: '3.3.2',
);

int _vehicleIsarModelEstimateSize(
  VehicleIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.normalizedPlateNumber.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ownerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.plateNumber.length * 3;
  {
    final value = object.qrCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _vehicleIsarModelSerialize(
  VehicleIsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.normalizedPlateNumber);
  writer.writeString(offsets[2], object.notes);
  writer.writeString(offsets[3], object.ownerName);
  writer.writeString(offsets[4], object.plateNumber);
  writer.writeString(offsets[5], object.qrCode);
}

VehicleIsarModel _vehicleIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VehicleIsarModel();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.normalizedPlateNumber = reader.readString(offsets[1]);
  object.notes = reader.readStringOrNull(offsets[2]);
  object.ownerName = reader.readStringOrNull(offsets[3]);
  object.plateNumber = reader.readString(offsets[4]);
  object.qrCode = reader.readStringOrNull(offsets[5]);
  return object;
}

P _vehicleIsarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vehicleIsarModelGetId(VehicleIsarModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vehicleIsarModelGetLinks(VehicleIsarModel object) {
  return [];
}

void _vehicleIsarModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  VehicleIsarModel object,
) {
  object.id = id;
}

extension VehicleIsarModelByIndex on IsarCollection<VehicleIsarModel> {
  Future<VehicleIsarModel?> getByNormalizedPlateNumber(
    String normalizedPlateNumber,
  ) {
    return getByIndex(r'normalizedPlateNumber', [normalizedPlateNumber]);
  }

  VehicleIsarModel? getByNormalizedPlateNumberSync(
    String normalizedPlateNumber,
  ) {
    return getByIndexSync(r'normalizedPlateNumber', [normalizedPlateNumber]);
  }

  Future<bool> deleteByNormalizedPlateNumber(String normalizedPlateNumber) {
    return deleteByIndex(r'normalizedPlateNumber', [normalizedPlateNumber]);
  }

  bool deleteByNormalizedPlateNumberSync(String normalizedPlateNumber) {
    return deleteByIndexSync(r'normalizedPlateNumber', [normalizedPlateNumber]);
  }

  Future<List<VehicleIsarModel?>> getAllByNormalizedPlateNumber(
    List<String> normalizedPlateNumberValues,
  ) {
    final values = normalizedPlateNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'normalizedPlateNumber', values);
  }

  List<VehicleIsarModel?> getAllByNormalizedPlateNumberSync(
    List<String> normalizedPlateNumberValues,
  ) {
    final values = normalizedPlateNumberValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'normalizedPlateNumber', values);
  }

  Future<int> deleteAllByNormalizedPlateNumber(
    List<String> normalizedPlateNumberValues,
  ) {
    final values = normalizedPlateNumberValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'normalizedPlateNumber', values);
  }

  int deleteAllByNormalizedPlateNumberSync(
    List<String> normalizedPlateNumberValues,
  ) {
    final values = normalizedPlateNumberValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'normalizedPlateNumber', values);
  }

  Future<Id> putByNormalizedPlateNumber(VehicleIsarModel object) {
    return putByIndex(r'normalizedPlateNumber', object);
  }

  Id putByNormalizedPlateNumberSync(
    VehicleIsarModel object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(
      r'normalizedPlateNumber',
      object,
      saveLinks: saveLinks,
    );
  }

  Future<List<Id>> putAllByNormalizedPlateNumber(
    List<VehicleIsarModel> objects,
  ) {
    return putAllByIndex(r'normalizedPlateNumber', objects);
  }

  List<Id> putAllByNormalizedPlateNumberSync(
    List<VehicleIsarModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(
      r'normalizedPlateNumber',
      objects,
      saveLinks: saveLinks,
    );
  }

  Future<VehicleIsarModel?> getByQrCode(String? qrCode) {
    return getByIndex(r'qrCode', [qrCode]);
  }

  VehicleIsarModel? getByQrCodeSync(String? qrCode) {
    return getByIndexSync(r'qrCode', [qrCode]);
  }

  Future<bool> deleteByQrCode(String? qrCode) {
    return deleteByIndex(r'qrCode', [qrCode]);
  }

  bool deleteByQrCodeSync(String? qrCode) {
    return deleteByIndexSync(r'qrCode', [qrCode]);
  }

  Future<List<VehicleIsarModel?>> getAllByQrCode(List<String?> qrCodeValues) {
    final values = qrCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'qrCode', values);
  }

  List<VehicleIsarModel?> getAllByQrCodeSync(List<String?> qrCodeValues) {
    final values = qrCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'qrCode', values);
  }

  Future<int> deleteAllByQrCode(List<String?> qrCodeValues) {
    final values = qrCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'qrCode', values);
  }

  int deleteAllByQrCodeSync(List<String?> qrCodeValues) {
    final values = qrCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'qrCode', values);
  }

  Future<Id> putByQrCode(VehicleIsarModel object) {
    return putByIndex(r'qrCode', object);
  }

  Id putByQrCodeSync(VehicleIsarModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'qrCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByQrCode(List<VehicleIsarModel> objects) {
    return putAllByIndex(r'qrCode', objects);
  }

  List<Id> putAllByQrCodeSync(
    List<VehicleIsarModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'qrCode', objects, saveLinks: saveLinks);
  }
}

extension VehicleIsarModelQueryWhereSort
    on QueryBuilder<VehicleIsarModel, VehicleIsarModel, QWhere> {
  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension VehicleIsarModelQueryWhere
    on QueryBuilder<VehicleIsarModel, VehicleIsarModel, QWhereClause> {
  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  normalizedPlateNumberEqualTo(String normalizedPlateNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'normalizedPlateNumber',
          value: [normalizedPlateNumber],
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  normalizedPlateNumberNotEqualTo(String normalizedPlateNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'normalizedPlateNumber',
                lower: [],
                upper: [normalizedPlateNumber],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'normalizedPlateNumber',
                lower: [normalizedPlateNumber],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'normalizedPlateNumber',
                lower: [normalizedPlateNumber],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'normalizedPlateNumber',
                lower: [],
                upper: [normalizedPlateNumber],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  qrCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'qrCode', value: [null]),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  qrCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'qrCode',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  qrCodeEqualTo(String? qrCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'qrCode', value: [qrCode]),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  qrCodeNotEqualTo(String? qrCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'qrCode',
                lower: [],
                upper: [qrCode],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'qrCode',
                lower: [qrCode],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'qrCode',
                lower: [qrCode],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'qrCode',
                lower: [],
                upper: [qrCode],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'createdAt', value: [createdAt]),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  createdAtGreaterThan(DateTime createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [createdAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  createdAtLessThan(DateTime createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [],
          upper: [createdAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterWhereClause>
  createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [lowerCreatedAt],
          includeLower: includeLower,
          upper: [upperCreatedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension VehicleIsarModelQueryFilter
    on QueryBuilder<VehicleIsarModel, VehicleIsarModel, QFilterCondition> {
  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  normalizedPlateNumberEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'normalizedPlateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  normalizedPlateNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'normalizedPlateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  normalizedPlateNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'normalizedPlateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  normalizedPlateNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'normalizedPlateNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  normalizedPlateNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'normalizedPlateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  normalizedPlateNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'normalizedPlateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  normalizedPlateNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'normalizedPlateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  normalizedPlateNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'normalizedPlateNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  normalizedPlateNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'normalizedPlateNumber', value: ''),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  normalizedPlateNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'normalizedPlateNumber',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'notes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'ownerName'),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'ownerName'),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ownerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ownerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ownerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ownerName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'ownerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'ownerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'ownerName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'ownerName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ownerName', value: ''),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  ownerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'ownerName', value: ''),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  plateNumberEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'plateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  plateNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'plateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  plateNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'plateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  plateNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'plateNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  plateNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'plateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  plateNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'plateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  plateNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'plateNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  plateNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'plateNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  plateNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'plateNumber', value: ''),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  plateNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'plateNumber', value: ''),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'qrCode'),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'qrCode'),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'qrCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'qrCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'qrCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'qrCode', value: ''),
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterFilterCondition>
  qrCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'qrCode', value: ''),
      );
    });
  }
}

extension VehicleIsarModelQueryObject
    on QueryBuilder<VehicleIsarModel, VehicleIsarModel, QFilterCondition> {}

extension VehicleIsarModelQueryLinks
    on QueryBuilder<VehicleIsarModel, VehicleIsarModel, QFilterCondition> {}

extension VehicleIsarModelQuerySortBy
    on QueryBuilder<VehicleIsarModel, VehicleIsarModel, QSortBy> {
  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByNormalizedPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normalizedPlateNumber', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByNormalizedPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normalizedPlateNumber', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByOwnerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerName', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByOwnerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerName', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByQrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCode', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  sortByQrCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCode', Sort.desc);
    });
  }
}

extension VehicleIsarModelQuerySortThenBy
    on QueryBuilder<VehicleIsarModel, VehicleIsarModel, QSortThenBy> {
  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByNormalizedPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normalizedPlateNumber', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByNormalizedPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normalizedPlateNumber', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByOwnerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerName', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByOwnerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerName', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByPlateNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByPlateNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plateNumber', Sort.desc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByQrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCode', Sort.asc);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QAfterSortBy>
  thenByQrCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCode', Sort.desc);
    });
  }
}

extension VehicleIsarModelQueryWhereDistinct
    on QueryBuilder<VehicleIsarModel, VehicleIsarModel, QDistinct> {
  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QDistinct>
  distinctByNormalizedPlateNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'normalizedPlateNumber',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QDistinct>
  distinctByOwnerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QDistinct>
  distinctByPlateNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plateNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehicleIsarModel, VehicleIsarModel, QDistinct> distinctByQrCode({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qrCode', caseSensitive: caseSensitive);
    });
  }
}

extension VehicleIsarModelQueryProperty
    on QueryBuilder<VehicleIsarModel, VehicleIsarModel, QQueryProperty> {
  QueryBuilder<VehicleIsarModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VehicleIsarModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VehicleIsarModel, String, QQueryOperations>
  normalizedPlateNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'normalizedPlateNumber');
    });
  }

  QueryBuilder<VehicleIsarModel, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<VehicleIsarModel, String?, QQueryOperations>
  ownerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerName');
    });
  }

  QueryBuilder<VehicleIsarModel, String, QQueryOperations>
  plateNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plateNumber');
    });
  }

  QueryBuilder<VehicleIsarModel, String?, QQueryOperations> qrCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qrCode');
    });
  }
}
