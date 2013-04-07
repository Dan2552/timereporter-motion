// Generated by IB v0.2.7 gem. Do not edit it manually
// Run `rake ib:open` to refresh

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface Camera





-(IBAction) imagePickerControllerDidCancel:(id) picker;
-(IBAction) picker;
-(IBAction) dismiss;
-(IBAction) camera_device;
-(IBAction) media_type_to_symbol:(id) media_type;
-(IBAction) symbol_to_media_type:(id) symbol;
-(IBAction) error:(id) type;
-(IBAction) load_constants_hack;

@end


@interface ParserError: StandardError







@end


@interface NSNotificationCenter





-(IBAction) observers;
-(IBAction) unobserve:(id) observer;

@end


@interface NSURLRequest





-(IBAction) to_s;

@end


@interface UIView





-(IBAction) handle_gesture:(id) recognizer;

@end


@interface UIViewController





-(IBAction) content_frame;

@end


@interface Response





-(IBAction) update:(id) values;
-(IBAction) to_s;
-(IBAction) update_status_description;

@end


@interface Query





-(IBAction) to_s;
-(IBAction) connectionDidFinishLoading:(id) connection;
-(IBAction) create_request;
-(IBAction) set_content_type;
-(IBAction) create_request_body;
-(IBAction) append_payload:(id) body;
-(IBAction) append_form_params:(id) body;
-(IBAction) append_files:(id) body;
-(IBAction) append_body_boundary:(id) body;
-(IBAction) create_url:(id) url_string;
-(IBAction) validate_url:(id) url;
-(IBAction) escape:(id) string;
-(IBAction) convert_payload_to_url;
-(IBAction) log:(id) message;
-(IBAction) escape_line_feeds:(id) hash;
-(IBAction) patch_nsurl_request:(id) request;
-(IBAction) call_delegator_with_response;

@end


@interface InvalidURLError: StandardError







@end


@interface ValidationSpecificationError: RuntimeError







@end


@interface RecordInvalid: RuntimeError





-(IBAction) validations;
-(IBAction) error_messages;
-(IBAction) error_messages_for:(id) field;
-(IBAction) validate_each:(id) validations;
-(IBAction) validation_method:(id) validation_type;
-(IBAction) each_validation_for:(id) field;

@end


@interface Store





-(IBAction) initialize:(id) db_adapter;

@end


@interface PersistFileError: Exception





-(IBAction) documents_file:(id) file_name;
-(IBAction) initWithCoder:(id) coder;
-(IBAction) encodeWithCoder:(id) coder;

@end


@interface Model





-(IBAction) cast_to_bool:(id) arg;
-(IBAction) cast_to_integer:(id) arg;
-(IBAction) cast_to_float:(id) arg;
-(IBAction) cast_to_date:(id) arg;
-(IBAction) cast_to_array:(id) arg;
-(IBAction) cast_to_string:(id) arg;

@end


@interface PersistFileError: Exception







@end


@interface RelationIsNilError: Exception







@end


@interface AdapterNotFoundError: Exception





-(IBAction) generate_belongs_to_id:(id) relation;
-(IBAction) column_type:(id) column;
-(IBAction) has_many_columns;
-(IBAction) has_one_columns;
-(IBAction) belongs_to_columns;
-(IBAction) default:(id) column;
-(IBAction) read:(id) attrs;
-(IBAction) destroy_all;
-(IBAction) first;
-(IBAction) last;
-(IBAction) column_from_hash:(id) hash;
-(IBAction) column_from_string_or_sym:(id) string;
-(IBAction) define_belongs_to_methods:(id) name;
-(IBAction) define_has_many_methods:(id) name;
-(IBAction) define_has_one_methods:(id) name;
-(IBAction) column_named:(id) name;
-(IBAction) attributes;
-(IBAction) update_attributes:(id) attrs;
-(IBAction) read_attribute:(id) name;
-(IBAction) to_i;
-(IBAction) to_s;
-(IBAction) set_auto_date_field:(id) field_name;
-(IBAction) delete;
-(IBAction) destroy;
-(IBAction) columns;
-(IBAction) options:(id) column_name;
-(IBAction) issue_notification:(id) info;

@end


@interface Column





-(IBAction) options;
-(IBAction) classify;

@end


@interface ArrayFinderQuery





-(IBAction) and:(id) field_name;
-(IBAction) in:(id) set;
-(IBAction) first;
-(IBAction) last;
-(IBAction) all;
-(IBAction) length;
-(IBAction) create:(id) options;
-(IBAction) push:(id) object;

@end


@interface ModelNotSetError: RuntimeError







@end


@interface FieldBindingMap





-(IBAction) model:(id) model_instance;
-(IBAction) field_count;
-(IBAction) field_at:(id) index;
-(IBAction) value_at:(id) field;
-(IBAction) fields;
-(IBAction) bind;
-(IBAction) textFieldShouldReturn:(id) textField;
-(IBAction) handle_keyboard_will_show:(id) notification;
-(IBAction) owner_cell_index_path;
-(IBAction) handle_keyboard_will_hide:(id) notification;
-(IBAction) find_first_responder:(id) parent;

@end


@interface String





-(IBAction) humanize;
-(IBAction) titleize;
-(IBAction) demodulize;
-(IBAction) pluralize;
-(IBAction) singularize;
-(IBAction) underscore;

@end


@interface Inflector





-(IBAction) initialize;
-(IBAction) reset;
-(IBAction) uncountable:(id) word;
-(IBAction) singularize:(id) word;
-(IBAction) pluralize:(id) word;
-(IBAction) titleize;

@end


@interface NilClass





-(IBAction) titleize;

@end


@interface Array





-(IBAction) titleize;

@end


@interface Hash





-(IBAction) titleize;

@end


@interface Symbol





-(IBAction) titleize;

@end


@interface SQLite3Adapter: SQLDBAdapter





-(IBAction) last_insert_row_id;

@end


@interface SQLScope





-(IBAction) table_name;
-(IBAction) order:(id) options;
-(IBAction) group:(id) column;
-(IBAction) limit:(id) limit;
-(IBAction) all;
-(IBAction) to_a;
-(IBAction) do_select;
-(IBAction) first;
-(IBAction) count;
-(IBAction) delete;
-(IBAction) to_sql;
-(IBAction) to_sql_sq;
-(IBAction) execute;
-(IBAction) select_str;
-(IBAction) joins_str;
-(IBAction) order_str;
-(IBAction) group_str;
-(IBAction) limit_str;
-(IBAction) options_str;
-(IBAction) type;

@end


@interface SQLCondition





-(IBAction) to_sql_str;

@end


@interface Relation





-(IBAction) scoped;
-(IBAction) to_a;
-(IBAction) reload;
-(IBAction) collection;
-(IBAction) instance;
-(IBAction) init_instance:(id) instance;
-(IBAction) build_from_instance:(id) associated_instance;

@end


@interface Join





-(IBAction) joined_table_name;
-(IBAction) joining_table_name;
-(IBAction) joined_table_key;
-(IBAction) joining_table_key;
-(IBAction) type;
-(IBAction) on_str;
-(IBAction) build_on_str;
-(IBAction) to_sql_str;
-(IBAction) select:(id) scope;

@end


@interface FMDBAdapter: SQLite3Adapter







@end


@interface Transaction





-(IBAction) initialize:(id) db;
-(IBAction) begin_transaction;
-(IBAction) end_transaction;
-(IBAction) commit;
-(IBAction) rollback;
-(IBAction) db_path;
-(IBAction) db;
-(IBAction) execute_sql:(id) sql;
-(IBAction) queue;

@end


@interface SQLContext





-(IBAction) to_s;
-(IBAction) log:(id) msg;
-(IBAction) execute;
-(IBAction) build;

@end


@interface SQLDBAdapter: BaseDBAdapter





-(IBAction) to_select_sql:(id) scope;
-(IBAction) to_delete_sql:(id) scope;

@end


@interface AnimationChain





-(IBAction) chains;
-(IBAction) start_chain:(id) chain;
-(IBAction) stop_chain:(id) chain;
-(IBAction) initialize;
-(IBAction) wait:(id) duration;
-(IBAction) do_next;
-(IBAction) start;
-(IBAction) stop;
-(IBAction) abort;

@end


@interface CLLocationCoordinate2D





-(IBAction) distance_to:(id) cl_location_2d;

@end


@interface String





-(IBAction) to_date;
-(IBAction) to_timezone;
-(IBAction) to_duration;

@end


@interface SugarNotFoundException: Exception







@end


@interface Fixnum





-(IBAction) nth;
-(IBAction) ordinalize;
-(IBAction) before:(id) date;
-(IBAction) ago;
-(IBAction) after:(id) date;
-(IBAction) hence;

@end


@interface NSArray





-(IBAction) to_pointer:(id) type;
-(IBAction) nsindexpath;
-(IBAction) nsindexset;

@end


@interface NSCoder





-(IBAction) bool:(id) key;
-(IBAction) double:(id) key;
-(IBAction) float:(id) key;
-(IBAction) int:(id) key;
-(IBAction) point:(id) key;
-(IBAction) rect:(id) key;
-(IBAction) size:(id) key;

@end


@interface NSDate





-(IBAction) string_with_format:(id) format;
-(IBAction) timezone;
-(IBAction) era;
-(IBAction) utc_offset;
-(IBAction) date_array;
-(IBAction) time_array;
-(IBAction) datetime_array;
-(IBAction) start_of_day;
-(IBAction) end_of_day;
-(IBAction) start_of_month;
-(IBAction) end_of_month;
-(IBAction) days_in_month;
-(IBAction) days_in_year;

@end


@interface NSIndexPath





-(IBAction) to_a;

@end


@interface IndexPath





-(IBAction) initialize:(id) values;

@end


@interface NSIndexSet





-(IBAction) to_a;

@end


@interface NSString





-(IBAction) nsurl;
-(IBAction) uiimage;
-(IBAction) uiimageview;
-(IBAction) escape_url;
-(IBAction) unescape_url;

@end


@interface NSString





-(IBAction) document;
-(IBAction) resource;
-(IBAction) resource_url;
-(IBAction) info_plist;

@end


@interface NSURL





-(IBAction) open;

@end


@interface NSUserDefaults





-(IBAction) remove:(id) key;

@end


@interface Object





-(IBAction) to_nsuserdefaults;

@end


@interface NilClass





-(IBAction) to_nsuserdefaults;

@end


@interface NSArray





-(IBAction) to_nsuserdefaults;

@end


@interface NSDictionary





-(IBAction) to_nsuserdefaults;

@end


@interface Numeric





-(IBAction) percent;
-(IBAction) radians;
-(IBAction) in_radians;
-(IBAction) degrees;
-(IBAction) in_degrees;
-(IBAction) pi;
-(IBAction) meters;
-(IBAction) in_meters;
-(IBAction) kilometers;
-(IBAction) in_kilometers;
-(IBAction) miles;
-(IBAction) in_miles;
-(IBAction) feet;
-(IBAction) in_feet;
-(IBAction) bytes;
-(IBAction) kilobytes;
-(IBAction) megabytes;
-(IBAction) gigabytes;
-(IBAction) terabytes;
-(IBAction) petabytes;
-(IBAction) exabytes;

@end


@interface Symbol





-(IBAction) look_in:(id) here;
-(IBAction) uidevice;
-(IBAction) uideviceorientation;
-(IBAction) uiinterfaceorientation;
-(IBAction) uiinterfacemask;
-(IBAction) uitextalignment;
-(IBAction) uilinebreakmode;
-(IBAction) uibaselineadjustment;
-(IBAction) uibuttontype;
-(IBAction) uibordertype;
-(IBAction) uicontrolstate;
-(IBAction) uicontrolevent;
-(IBAction) uireturnkey;
-(IBAction) uiactivityindicatorstyle;
-(IBAction) uisegmentedstyle;
-(IBAction) uidatepickermode;
-(IBAction) uicontentmode;
-(IBAction) uitablestyle;
-(IBAction) uitablerowanimation;
-(IBAction) uitablecellstyle;
-(IBAction) uitablecellaccessory;
-(IBAction) uitablecellselectionstyle;
-(IBAction) uitablecellseparatorstyle;
-(IBAction) uistatusbarstyle;
-(IBAction) uibarmetrics;
-(IBAction) uibarbuttonitem;
-(IBAction) uibarbuttonstyle;
-(IBAction) uikeyboardtype;
-(IBAction) uiautoresizemask;
-(IBAction) uiimagesource;
-(IBAction) uiimagecapture;
-(IBAction) uiimagecamera;
-(IBAction) uiimagequality;
-(IBAction) catimingfunction;
-(IBAction) cglinecap;
-(IBAction) cglinejoin;
-(IBAction) uigesturerecognizerstate;
-(IBAction) uifontsize;
-(IBAction) nsdatestyle;
-(IBAction) nsnumberstyle;

@end


@interface Numeric





-(IBAction) milliseconds;
-(IBAction) in_milliseconds;
-(IBAction) seconds;
-(IBAction) in_seconds;
-(IBAction) minutes;
-(IBAction) in_minutes;
-(IBAction) hours;
-(IBAction) in_hours;
-(IBAction) days;
-(IBAction) in_days;
-(IBAction) weeks;
-(IBAction) in_weeks;
-(IBAction) months;
-(IBAction) in_months;
-(IBAction) years;
-(IBAction) in_years;

@end


@interface NSError





-(IBAction) localized;
-(IBAction) to_s;

@end


@interface NSLayoutConstraint





-(IBAction) to_s;

@end


@interface NSSet





-(IBAction) to_s;

@end


@interface UIColor





-(IBAction) to_s;

@end


@interface UIEvent





-(IBAction) to_s;

@end


@interface UITouch





-(IBAction) to_s;

@end


@interface UIViewController





-(IBAction) to_s;

@end


@interface UIActionSheet





-(IBAction) dummy;

@end


@interface UIActivityIndicatorView





-(IBAction) large;
-(IBAction) white;
-(IBAction) gray;

@end


@interface UIAlertView





-(IBAction) dummy;

@end


@interface UIBarButtonItem





-(IBAction) sugarcube_handle_action:(id) sender;

@end


@interface UIButton





-(IBAction) custom;
-(IBAction) rounded;
-(IBAction) rounded_rect;
-(IBAction) detail;
-(IBAction) detail_disclosure;
-(IBAction) info;
-(IBAction) info_light;
-(IBAction) info_dark;
-(IBAction) contact;
-(IBAction) contact_add;

@end


@interface UIColor





-(IBAction) cgcolor;
-(IBAction) invert;
-(IBAction) red;
-(IBAction) green;
-(IBAction) blue;
-(IBAction) alpha;
-(IBAction) css_name;

@end


@interface UIControl





-(IBAction) sugarcube_callbacks;

@end


@interface UIImage





-(IBAction) uiimageview;
-(IBAction) nsdata;
-(IBAction) in_rect:(id) rect;
-(IBAction) scale_to_fill:(id) new_size;
-(IBAction) scale_within:(id) new_size;
-(IBAction) scale_to:(id) new_size;
-(IBAction) rotate:(id) angle_or_direction;
-(IBAction) masked:(id) mask_image;
-(IBAction) color_at:(id) point;
-(IBAction) at_scale:(id) scale;

@end


@interface UISegmentedControl





-(IBAction) plain:(id) items;
-(IBAction) bordered:(id) items;
-(IBAction) bar:(id) items;
-(IBAction) bezeled:(id) items;

@end


@interface UITextView





-(IBAction) sugarcube_callbacks;

@end


@interface UIView





-(IBAction) first_responder;
-(IBAction) controller;
-(IBAction) unshift:(id) view;
-(IBAction) show;
-(IBAction) hide;

@end


@interface UIViewController





-(IBAction) push:(id) view_controller;

@end


@interface UINavigationController





-(IBAction) push:(id) view_controller;

@end


@interface UITabBarController





-(IBAction) push:(id) view_controller;

@end


@interface AppDelegate





-(IBAction) setup_database;
-(IBAction) setup_window;

@end


@interface TimeEntriesController: UIViewController

@property IBOutlet id selected_date_label;
@property IBOutlet id calendar_view;



-(IBAction) viewDidAppear:(id) animated;
-(IBAction) back_pressed;
-(IBAction) forward_pressed;
-(IBAction) update_date_label;
-(IBAction) refresh_time_entries;

@end


@interface UserController: UIViewController

@property IBOutlet id username_field;
@property IBOutlet id password_field;



-(IBAction) viewDidAppear:(id) animated;
-(IBAction) login:(id) sender;
-(IBAction) send_login;
-(IBAction) load_persisted_credentials;
-(IBAction) save_persisted_credentials;
-(IBAction) segue_to_time_entries;

@end


@interface Base





-(IBAction) to_hash;
-(IBAction) payload;

@end


@interface TimeEntry: ModelSync







@end


@interface User: ModelSync







@end


@interface CalendarGridView: UIView





-(IBAction) initWithCoder:(id) coder;
-(IBAction) add_child;
-(IBAction) drawRect:(id) rect;
-(IBAction) grid;
-(IBAction) time_labels;
-(IBAction) hour_height;
-(IBAction) half_hour_height;

@end


@interface TimeEntryView: UIView





-(IBAction) initWithFrame:(id) frame;
-(IBAction) drawRect:(id) rect;
-(IBAction) load_xib;

@end



